library(manipulateWidget)


### Name: compareOptions
### Title: Options for comparison mode
### Aliases: compareOptions

### ** Examples

if (require(dygraphs)) {

  mydata <- data.frame(
    year = 2000+1:100,
    series1 = rnorm(100),
    series2 = rnorm(100),
    series3 = rnorm(100)
  )
  manipulateWidget(
    dygraph(mydata[range[1]:range[2] - 2000, c("year", series)], main = title),
    range = mwSlider(2001, 2100, c(2001, 2100)),
    series = mwSelect(c("series1", "series2", "series3")),
    title = mwText("Fictive time series"),
    .compare = list(title = NULL, series = NULL),
    .compareOpts = compareOptions(ncharts = 4)
  )

  manipulateWidget(
    dygraph(mydata[range[1]:range[2] - 2000, c("year", series)], main = title),
    range = mwSlider(2001, 2100, c(2001, 2100)),
    series = mwSelect(c("series1", "series2", "series3")),
    title = mwText("Fictive time series"),
    .compare = list(title = NULL, series = NULL),
    .compareOpts = compareOptions(ncharts = 3, nrow = 3)
  )
}




