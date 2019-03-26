library(geojsonlint)


### Name: gj_write
### Title: Write inputs to a geojson file
### Aliases: gj_write

### ** Examples

gj_write(x = '{"type": "Point", "coordinates": [-100, 80]}',
  (file <- tempfile()))
jsonlite::fromJSON(file)



