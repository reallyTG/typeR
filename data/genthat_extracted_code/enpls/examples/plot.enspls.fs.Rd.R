library(enpls)


### Name: plot.enspls.fs
### Title: Plot enspls.fs object
### Aliases: plot.enspls.fs

### ** Examples

data("logd1k")
x = logd1k$x
y = logd1k$y

set.seed(42)
fs = enspls.fs(x, y, reptimes = 5, maxcomp = 2)
plot(fs, nvar = 10)
plot(fs, type = "boxplot", limits = c(0.05, 0.95), nvar = 10)



