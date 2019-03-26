library(spls)


### Name: coefplot.spls
### Title: Plot estimated coefficients of the SPLS object
### Aliases: coefplot.spls
### Keywords: hplot

### ** Examples

data(yeast)
# SPLS with eta=0.7 & 8 hidden components
f <- spls( yeast$x, yeast$y, K=8, eta=0.7 )
# Draw estimated coefficient plot of the first four variables
# among the selected predictors
coefplot.spls( f, xvar=c(1:4), nwin=c(2,2) )



