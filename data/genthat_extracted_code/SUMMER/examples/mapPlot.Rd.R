library(SUMMER)


### Name: mapPlot
### Title: Makes map plot.
### Aliases: mapPlot

### ** Examples

## Not run: 
##D data(DemoMap)
##D # Plotting data in the long format
##D dat <- data.frame(region = rep(c("central",  "eastern", "northern", "western"), 3),
##D year = rep(c(1980, 1990, 2000), each = 4),
##D values = stats::rnorm(12))
##D utils::head(dat)
##D mapPlot(dat, variables = "year", values = "values",
##D by.data = "region", geo = DemoMap$geo,
##D by.geo = "NAME_final", is.long = TRUE)
##D dat <- data.frame(region = c("central",  "eastern", "northern", "western"),
##D Year1 = stats::rnorm(4), Year2 = stats::rnorm(4),
##D Year3 = stats::rnorm(4))
##D utils::head(dat)
##D mapPlot(dat, variables = c("Year1", "Year2", "Year3"),
##D  labels = c(1980, 1990, 2000),
##D by.data = "region", geo = DemoMap$geo,
##D by.geo = "NAME_final", is.long = FALSE)
##D 
## End(Not run)




