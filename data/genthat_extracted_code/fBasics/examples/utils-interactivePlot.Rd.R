library(fBasics)


### Name: interactivePlot
### Title: Interactive Plot Utility
### Aliases: interactivePlot
### Keywords: hplot

### ** Examples

## Test Plot Function:
   testPlot = function(x, which = "all", ...) {   
     # Plot Function and Addons:
     plot.1 <<- function(x, ...) plot(x, ...)      
     plot.2 <<- function(x, ...) acf(x, ...)
     plot.3 <<- function(x, ...) hist(x, ...)      
     plot.4 <<- function(x, ...) qqnorm(x, ...)
     # Plot:
     interactivePlot(x,
       choices = c("Series Plot", "ACF", "Histogram", "QQ Plot"),
       plotFUN = c("plot.1", "plot.2", "plot.3", "plot.4"),
       which = which, ...)       
     # Return Value:
     invisible()
   }  
   # Plot:
   par(mfrow = c(2, 2), cex = 0.7)
   testPlot(rnorm(500))
      
   # Try:
   # par(mfrow = c(1,1))
   # testPlot(rnorm(500), which = "ask")



