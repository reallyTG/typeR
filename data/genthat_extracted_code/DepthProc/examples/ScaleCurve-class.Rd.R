library(DepthProc)


### Name: ScaleCurve-class
### Title: ScaleCurve and ScaleCurveList
### Aliases: ScaleCurve-class

### ** Examples

library(mvtnorm)
x <- mvrnorm(n = 100, mu = c(0, 0), Sigma = 2 * diag(2))
y <- rmvt(n = 100, sigma = diag(2), df = 4)
s1 <- scaleCurve(x, depth_params = list(method = "Projection"))
s2 <- scaleCurve(y, depth_params = list(method = "Projection"), name = "Set2")

sc_list <- combineDepthCurves(s1, s2) # Add one curve to another

plot(sc_list) # Draw plot with two curves

z <- mvrnorm(n = 100, mu = c(0, 0), Sigma = 1 * diag(2))
s3 <- scaleCurve(z, depth_params = list(method = "Projection"))
plot(combineDepthCurves(sc_list, s3)) # Add third curve and draw a plot




