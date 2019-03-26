library(geojsonlint)


### Name: geojson_hint
### Title: Validate GeoJSON using geojsonhint Javascript library
### Aliases: geojson_hint

### ** Examples

geojson_hint('{"type": "FooBar"}')
geojson_hint('{ "type": "FeatureCollection" }')
geojson_hint(
  '{"type":"Point","geometry":{"type":"Point","coordinates":[-80,40]},"properties":{}}'
)

# A file
file <- system.file("examples", "zillow_or.geojson", package = "geojsonlint")
geojson_hint(as.location(file))

# A URL
url <- "https://raw.githubusercontent.com/glynnbird/usstatesgeojson/master/california.geojson"
geojson_hint(as.location(url))

# from json (jsonlite class)
x <- jsonlite::minify('{ "type": "FeatureCollection" }')
class(x)
geojson_hint(x)

# toggle whether reason for validation failure is given back
geojson_hint('{ "type": "FeatureCollection" }')
geojson_hint('{ "type": "FeatureCollection" }', inform = TRUE)

# toggle whether to stop with error message
geojson_hint('{ "type": "FeatureCollection" }')
geojson_hint('{ "type": "FeatureCollection" }', inform = TRUE)
if (interactive()) {
  geojson_hint('{ "type": "FeatureCollection" }', error = TRUE)
}



