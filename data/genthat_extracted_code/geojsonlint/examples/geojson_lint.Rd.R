library(geojsonlint)


### Name: geojson_lint
### Title: Validate GeoJSON using geojsonlint.com web service
### Aliases: geojson_lint

### ** Examples

## Not run: 
##D library(jsonlite)
##D 
##D # From a json character string
##D ## good
##D geojson_lint('{"type": "Point", "coordinates": [-100, 80]}')
##D json_good <- minify('{"type": "Point", "coordinates": [-100, 80]}')
##D geojson_lint(json_good)
##D ## bad
##D geojson_lint('{"type": "Rhombus", "coordinates": [[1, 2], [3, 4], [5, 6]]}')
##D json_bad <- minify(
##D  '{"type": "Rhombus", "coordinates": [[1, 2], [3, 4], [5, 6]]}')
##D geojson_lint(json_bad)
##D 
##D # A file
##D file <- system.file("examples", "zillow_or.geojson", package = "geojsonlint")
##D geojson_lint(x = as.location(file))
##D 
##D # A URL
##D url <- "https://raw.githubusercontent.com/glynnbird/usstatesgeojson/master/california.geojson"
##D geojson_lint(as.location(url))
##D 
##D # toggle whether reason for validation failure is given back
##D geojson_lint('{ "type": "FeatureCollection" }')
##D geojson_lint('{ "type": "FeatureCollection" }', inform = TRUE)
##D 
##D # toggle whether to stop with error message
##D geojson_lint('{ "type": "FeatureCollection" }')
##D geojson_lint('{ "type": "FeatureCollection" }', inform = TRUE)
##D if (interactive()) {
##D   geojson_lint('{ "type": "FeatureCollection" }', error = TRUE)
##D }
## End(Not run)



