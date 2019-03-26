library(vsn)


### Name: meanSdPlot
### Title: Plot row standard deviations versus row means
### Aliases: meanSdPlot meanSdPlot-methods meanSdPlot,matrix-method
###   meanSdPlot,ExpressionSet-method meanSdPlot,vsn-method
###   meanSdPlot,MAList-method
### Keywords: hplot methods

### ** Examples

  data("kidney")
  log.na <- function(x) log(ifelse(x>0, x, NA))

  exprs(kidney) <- log.na(exprs(kidney))
  msd <- meanSdPlot(kidney)

  ## The `ggplot` object is returned in list element `gg`, here is an example of how to modify the plot
  library("ggplot2")
  msd$gg + ggtitle("Hello world") + scale_fill_gradient(low = "yellow", high = "darkred") + scale_y_continuous(limits = c(0, 7))  

  ## Try this out with not log-transformed data, vsn2-transformed data, the lymphoma data, your data ...



