library(mrbsizeR)


### Name: TaperingPlot
### Title: Plot of tapering functions.
### Aliases: TaperingPlot

### ** Examples

# Signal-independent tapering function plot for a 30-by-10 object with 
# the smoothing parameter sequence [0, 1, 10, 1000, inf]: 

TaperingPlot(lambdaSmoother = c(1, 10, 1000), mm = 30, nn = 10)


# Signal-dependent tapering function plot for a 30-by-10 object with 
# the smoothing parameter sequence [0, 1, 10, 1000, inf]: 

set.seed(987)
xmuExample <- c(stats::rnorm(300))
TaperingPlot(lambdaSmoother = c(1, 10, 1000), mm = 30, nn = 10, 
             Xmu = xmuExample)





