library(vegawidget)


### Name: image
### Title: Create or write image
### Aliases: image vw_to_svg vw_to_bitmap vw_write_svg vw_write_png

### ** Examples

## Not run: 
##D   # requires nodejs to be installed
##D 
##D   # call any of these functions using either a vegaspec or a vegawidget
##D   vw_to_svg(vegawidget(spec_mtcars))
##D   vw_to_bitmap(spec_mtcars)
##D   vw_write_png(spec_mtcars, file.path(tempdir(), "temp.png"))
##D   vw_write_svg(spec_mtcars, file.path(tempdir(), "temp.svg"))
##D 
##D   # To specify the path to a local file, use base_url
##D   spec_precip <-
##D     list(
##D       `$schema` = vega_schema(),
##D       data = list(url = "seattle-weather.csv"),
##D       mark = "tick",
##D       encoding = list(
##D         x = list(field = "precipitation", type = "quantitative")
##D       )
##D     ) %>%
##D     as_vegaspec()
##D 
##D   data_dir <- system.file("example-data/", package = "vegawidget")
##D   vw_write_png(
##D     spec_precip,
##D     file.path(tempdir(), "temp-local.png"),
##D     base_url = data_dir
##D   )
##D 
## End(Not run)



