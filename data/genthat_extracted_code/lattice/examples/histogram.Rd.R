library(lattice)


### Name: B_03_histogram
### Title: Histograms and Kernel Density Plots
### Aliases: histogram histogram.factor histogram.numeric histogram.formula
###   densityplot densityplot.numeric densityplot.formula do.breaks
### Keywords: hplot

### ** Examples

require(stats)
histogram( ~ height | voice.part, data = singer, nint = 17,
          endpoints = c(59.5, 76.5), layout = c(2,4), aspect = 1,
          xlab = "Height (inches)")

histogram( ~ height | voice.part, data = singer,
          xlab = "Height (inches)", type = "density",
          panel = function(x, ...) {
              panel.histogram(x, ...)
              panel.mathdensity(dmath = dnorm, col = "black",
                                args = list(mean=mean(x),sd=sd(x)))
          } )

densityplot( ~ height | voice.part, data = singer, layout = c(2, 4),  
            xlab = "Height (inches)", bw = 5)



