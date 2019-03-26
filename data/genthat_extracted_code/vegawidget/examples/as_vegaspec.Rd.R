library(vegawidget)


### Name: as_vegaspec
### Title: Coerce to vegaspec
### Aliases: as_vegaspec as_vegaspec.default as_vegaspec.vegaspec
###   as_vegaspec.list as_vegaspec.json as_vegaspec.character
###   as_vegaspec.vegawidget

### ** Examples

  spec <- list(
    `$schema` = vega_schema(),
    data = list(values = mtcars),
    mark = "point",
    encoding = list(
      x = list(field = "wt", type = "quantitative"),
      y = list(field = "mpg", type = "quantitative"),
      color = list(field = "cyl", type = "nominal")
    )
  )

  as_vegaspec(spec)

  ## Not run: 
##D     # requires network-access
##D     as_vegaspec("https://vega.github.io/vega-lite/examples/specs/bar.vl.json")
##D   
## End(Not run)



