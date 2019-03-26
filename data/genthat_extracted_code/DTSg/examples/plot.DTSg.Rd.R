library(DTSg)


### Name: plot.DTSg
### Title: Plot Time Series
### Aliases: plot.DTSg plot

### ** Examples

# new DTSg object
x <- DTSg$new(values = flow)

# plot time series
if (requireNamespace("xts", quietly = TRUE) &&
    requireNamespace("dygraphs", quietly = TRUE) &&
    requireNamespace("RColorBrewer", quietly = TRUE)) {
  ## R6 method
  x$plot()

  ## S3 method
  plot(x = x)
}




