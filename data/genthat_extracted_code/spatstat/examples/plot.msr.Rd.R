library(spatstat)


### Name: plot.msr
### Title: Plot a Signed or Vector-Valued Measure
### Aliases: plot.msr
### Keywords: spatial hplot

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X, ~x+y)
   rp <- residuals(fit, type="pearson")
   rs <- residuals(fit, type="score")

   plot(rp)
   plot(rs)
   plot(rs, how="contour")



