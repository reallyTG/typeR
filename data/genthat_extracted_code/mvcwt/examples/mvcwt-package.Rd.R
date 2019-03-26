library(mvcwt)


### Name: mvcwt-package
### Title: Wavelet transform of multivariate time series
### Aliases: mvcwt-package
### Keywords: package

### ** Examples

## Not run: 
##D   x = seq(-pi, pi, len = 200)
##D   y1 = sin(8 * x) + sin(32 * x)
##D   y2 = sin(8 * (x + pi/8)) + sin(32 * x)
##D   matplot(x, cbind(y1, y2), type = "l", lty = 1)
##D   w = mvcwt(x, cbind(y1, y2))
##D   plot(w, var = 1:2, scale = 2^seq(log2(min(w$y)), log2(max(w$y)), len = 5))
##D   mr = wmr(w, smoothing = 2)
##D   image(mr, reset.par = FALSE)
##D   contour(mr, levels = c(0.01, 0.05, 0.1, 0.25, 0.5, 0.75, 0.9, 0.95, 0.99), add = TRUE)
## End(Not run)



