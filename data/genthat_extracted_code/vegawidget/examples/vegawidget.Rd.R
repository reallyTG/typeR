library(vegawidget)


### Name: vegawidget
### Title: Create a Vega/Vega-Lite htmlwidget
### Aliases: vegawidget

### ** Examples

  vegawidget(spec_mtcars, width = 350, height = 350)

  # vegaspec with a data URL
  spec_precip <-
    list(
      `$schema` = vega_schema(),
      data = list(url = "seattle-weather.csv"),
      mark = "tick",
      encoding = list(
        x = list(field = "precipitation", type = "quantitative")
      )
    ) %>%
    as_vegaspec()

  # define local path to file
  path_local <- system.file("example-data/", package = "vegawidget")

  # render using local path
  vegawidget(spec_precip, base_url = path_local)

## Not run: 
##D   # requires network-access
##D 
##D   # define remote path to file
##D   url_remote <- "https://vega.github.io/vega-datasets/data"
##D 
##D   # render using remote path
##D   # note: does not render in RStudio IDE; open using browser
##D   vegawidget(spec_precip, base_url = url_remote)
## End(Not run)



