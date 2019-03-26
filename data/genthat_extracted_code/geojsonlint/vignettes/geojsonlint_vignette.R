## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = FALSE, 
  message = FALSE
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("geojsonlint")

## ----eval=FALSE----------------------------------------------------------
#  remotes::install_github("ropensci/geojsonlint")

## ------------------------------------------------------------------------
library("geojsonlint")

## ----eval = FALSE--------------------------------------------------------
#  geojson_lint(x = '{"type": "Point", "coordinates": [-100, 80]}')
#  #> [1] TRUE

## ------------------------------------------------------------------------
geojson_hint(x = '{"type": "Point", "coordinates": [-100, 80]}')

## ------------------------------------------------------------------------
geojson_validate(x = '{"type": "Point", "coordinates": [-100, 80]}')

## ----eval = FALSE--------------------------------------------------------
#  geojson_lint('{"type": "FooBar"}')
#  #> [1] FALSE

## ------------------------------------------------------------------------
geojson_hint('{"type": "FooBar"}')

## ------------------------------------------------------------------------
geojson_validate('{ "type": "FeatureCollection" }')

## ----eval = FALSE--------------------------------------------------------
#  geojson_lint('{"type": "FooBar"}', inform = TRUE)
#  #> [1] FALSE
#  #> attr(,"errors")
#  #>                                 message status
#  #> 1 "FooBar" is not a valid GeoJSON type.  error

## ------------------------------------------------------------------------
geojson_hint('{"type": "FooBar"}', inform = TRUE)

## ------------------------------------------------------------------------
geojson_validate('{ "type": "FeatureCollection" }', inform = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  geojson_lint('{"type": "FooBar"}', error = TRUE)
#  #> Error: invalid GeoJSON
#  #>    - "FooBar" is not a valid GeoJSON type.

## ----eval=FALSE----------------------------------------------------------
#  geojson_hint('{"type": "FooBar"}', error = TRUE)
#  #> Error: Line 1
#  #>    - The type FooBar is unknown

## ----eval=FALSE----------------------------------------------------------
#  geojson_validate('{ "type": "FeatureCollection" }', error = TRUE)
#  #> Error: 1 error validating json:
#  #> 	- data: no (or more than one) schemas match

