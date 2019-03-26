library(enpls)


### Name: print.enspls.fs
### Title: Print enspls.fs Object
### Aliases: print.enspls.fs

### ** Examples

data("logd1k")
x = logd1k$x
y = logd1k$y

set.seed(42)
fs = enspls.fs(
  x, y, reptimes = 5, maxcomp = 3,
  alpha = c(0.3, 0.6, 0.9))
print(fs, nvar = 10L)



