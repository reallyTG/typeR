library(mvp)


### Name: zero
### Title: The zero polynomial
### Aliases: zero is.zero
### Keywords: symbolmath

### ** Examples


constant(0)

t1 <- as.mvp("x+y")
t2 <- as.mvp("x-y")

stopifnot(is.zero(t1*t2-as.mvp("x^2-y^2")))




