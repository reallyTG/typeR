library(sfsmisc)


### Name: errbar
### Title: Scatter Plot with Error Bars
### Aliases: errbar
### Keywords: hplot

### ** Examples

y <- rnorm(10); d <- 1 + .1*rnorm(10)
errbar(1:10, y, y + d, y - d, main="Error Bars example")



