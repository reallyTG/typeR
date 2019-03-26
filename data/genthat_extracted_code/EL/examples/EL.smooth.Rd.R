library(EL)


### Name: EL.smooth
### Title: Smooth estimates and confidence intervals (or simultaneous
###   bands) using the smoothed two-sample EL method
### Aliases: EL.smooth
### Keywords: ~hplot ~nonparametric ~smooth

### ** Examples

#### Simultaneous confidence bands for a P-P plot
X1 <- rnorm(200)
X2 <- rnorm(200, 1)

x <- seq(0.05, 0.95, length=19)
y <- EL.smooth("pp", X1, X2, x, conf.level=0.95, 
               simultaneous=TRUE, bw=c(0.3, 0.3))

## Plot the graph with both pointwise and simultaneous confidence bands
EL.plot("pp", X1, X2, conf.level=0.95, bw=c(0.3, 0.3))
lines(x, y$conf.int[1,], lty="dotted")
lines(x, y$conf.int[2,], lty="dotted")




