library(DepthProc)


### Name: plot
### Title: Method for plotting DepthCurve and DDPlot object.
### Aliases: plot plot,DDPlot,ANY-method plot,DepthCurve,ANY-method
###   plot,DepthCurveList,ANY-method

### ** Examples


x <- mvrnorm(n = 100, mu = c(0, 0), Sigma = 3 * diag(2))
sc <- scaleCurve(x)
plot(sc)




