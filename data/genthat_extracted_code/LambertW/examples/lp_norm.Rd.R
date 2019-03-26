library(LambertW)


### Name: lp_norm
### Title: lp norm of a vector
### Aliases: lp_norm
### Keywords: math

### ** Examples


kRealVec <- c(3, 4)
# Pythagoras
lp_norm(kRealVec)
# did not know Manhattan,
lp_norm(kRealVec, p = 1)

# so he just imagined running in circles.
kComplexVec <- exp(1i * runif(20, -pi, pi))
plot(kComplexVec)
sapply(kComplexVec, lp_norm)




