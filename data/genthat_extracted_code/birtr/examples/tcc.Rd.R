library(birtr)


### Name: tcc
### Title: Test Characteristic Curve
### Aliases: tcc
### Keywords: tcc

### ** Examples

b <- c(-2.0, -1.0, 0.0, 1.0, 2.0)
a <- c(0.5, 0.75, 1.0, 0.75, 0.5)
c <- c(.2, .2, .2, .2, .2)
tcc(b, a, c)
tcc(a = a, b = b, c = c)
tcc(b)    # tcc(b, a = rep(1, length(b)), c = rep(0, length(b)))
tcc(b, a) # tcc(b, a, c = rep(0, length(b)))



