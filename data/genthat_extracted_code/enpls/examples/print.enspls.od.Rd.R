library(enpls)


### Name: print.enspls.od
### Title: Print enspls.od Object
### Aliases: print.enspls.od

### ** Examples

data("logd1k")
x = logd1k$x
y = logd1k$y

set.seed(42)
od = enspls.od(
  x, y, reptimes = 5, maxcomp = 3,
  alpha = c(0.3, 0.6, 0.9))
print(od)



