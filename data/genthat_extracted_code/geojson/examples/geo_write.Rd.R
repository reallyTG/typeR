library(geojson)


### Name: geo_write
### Title: Write geojson to disk
### Aliases: geo_write

### ** Examples

file <- tempfile(fileext = ".geojson")
geo_write(
  point('{ "type": "Point", "coordinates": [100.0, 0.0] }'),
  file
)
readLines(file)
unlink(file)



