library(enpls)


### Name: enspls.od
### Title: Ensemble Sparse Partial Least Squares for Outlier Detection
### Aliases: enspls.od

### ** Examples

data("logd1k")
x = logd1k$x
y = logd1k$y

set.seed(42)
od = enspls.od(
  x, y, reptimes = 5, maxcomp = 3,
  alpha = c(0.3, 0.6, 0.9))
plot(od, prob = 0.1)
plot(od, criterion = "sd", sdtimes = 1)



