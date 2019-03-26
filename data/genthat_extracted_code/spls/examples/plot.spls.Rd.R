library(spls)


### Name: plot.spls
### Title: Plot the coefficient path of SPLS regression
### Aliases: plot.spls
### Keywords: hplot methods

### ** Examples

data(yeast)
# SPLS with eta=0.7 & 8 hidden components
f <- spls( yeast$x, yeast$y, K=8, eta=0.7 )
# Draw coefficient path plots for the first two responses
plot( f, yvar=c(1:2) )



