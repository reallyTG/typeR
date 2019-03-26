library(geojsonlint)


### Name: geojson_validate
### Title: Validate GeoJSON using is-my-json-valid Javascript library
### Aliases: geojson_validate

### ** Examples

# From a json character string
## good
geojson_validate('{"type": "Point", "coordinates": [-100, 80]}')
## bad
geojson_validate(
 '{"type": "Rhombus", "coordinates": [[1, 2], [3, 4], [5, 6]]}')

# A file
file <- system.file("examples", "zillow_or.geojson",
  package = "geojsonlint")
geojson_validate(x = as.location(file))

# A URL
url <- "https://raw.githubusercontent.com/glynnbird/usstatesgeojson/master/california.geojson"
geojson_validate(as.location(url))

# toggle whether reason for validation failure is given back
geojson_validate('{ "type": "FeatureCollection" }')
geojson_validate('{ "type": "FeatureCollection" }', inform = TRUE)

# toggle whether to stop with error message
geojson_validate('{ "type": "FeatureCollection" }')
geojson_validate('{ "type": "FeatureCollection" }', inform = TRUE)
if (interactive()) {
  geojson_validate('{ "type": "FeatureCollection" }', error = TRUE)
}



