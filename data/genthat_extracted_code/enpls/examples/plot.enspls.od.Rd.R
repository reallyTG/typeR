library(enpls)


### Name: plot.enspls.od
### Title: Plot enspls.od object
### Aliases: plot.enspls.od

### ** Examples

data("logd1k")
x = logd1k$x
y = logd1k$y

set.seed(42)
od = enspls.od(x, y, reptimes = 4, maxcomp = 2)
plot(od, criterion = "quantile", prob = 0.1)
plot(od, criterion = "sd", sdtimes = 1)



