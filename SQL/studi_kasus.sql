-- 1. Menampilkan nama-nama band
SELECT bands.name AS 'Band Name'
FROM bands;

-- 2. Menampilkan data album paling tua
SELECT * 
FROM albums
ORDER BY release_year
LIMIT 1;

-- 3. Memperoleh nilai rata-rata dari total durasi lagu
SELECT AVG(length) AS 'Average Song Duration'
FROM songs;

-- 4. Memperoleh keseluruhan nama bands pada album 
-- distinct digunakan agar setiap baris tidak ada yang sama
SELECT DISTINCT bands.name AS 'Band Name'
FROM bands
JOIN albums ON bands.id = albums.band_id;

-- 5. Album terpanjang 
SELECT
  albums.name as Name,
  albums.release_year as 'Release Year',
  SUM(songs.length) as 'Duration'
FROM albums
JOIN songs on albums.id = songs.album_id
GROUP BY songs.album_id
ORDER BY Duration DESC
LIMIT 1;

-- 6. Lagu terpanjang ditiap album 
SELECT
  albums.name AS 'Album',
  albums.release_year AS 'Release Year',
  MAX(songs.length) AS 'Duration'
FROM albums
JOIN songs ON albums.id = songs.album_id
GROUP BY songs.album_id;

-- 7. Banyaknya lagu untuk tiap band 
SELECT
  bands.name AS 'Band',
  COUNT(songs.id) AS 'Number of Songs'
FROM bands
JOIN albums ON bands.id = albums.band_id
JOIN songs ON albums.id = songs.album_id
GROUP BY albums.band_id;

-- 8. Rata-rata panjang durasi pada setiap album
select 
    albums.name as album,
    avg(songs.length) as 'rataan_durasi'
from albums
join songs on albums.id = songs.album_id
GROUP BY songs.album_id
order by avg(songs.length) desc
;

--  9. Rata-rata panjang durasi pada setiap bands
select 
	bands.name as nama,
    avg(songs.length) as 'durasi'
from bands
JOIN albums ON bands.id = albums.band_id
JOIN songs ON albums.id = songs.album_id
GROUP BY albums.band_id
order by avg(songs.length) desc
;

-- 10. Lagu terpanjang pada masing-masing album
select 
	songs.name as nama_lagu,
    max(songs.length) as durasi
from songs
join albums on albums.id = songs.album_id
group by album_id
order by max(songs.length) desc
;

select * from songs
