library(sitar)


### Name: cLMS
### Title: LMS conversion to and from z-scores
### Aliases: cLMS zLMS zLMS
### Keywords: arith

### ** Examples


cLMS(z = as.matrix(-2:2), L = 1:-1, M = 5:7, S = rep(0.1, 3))
cLMS(z = 0:2, L = 1:-1, M = 7, S = 0.1)
cLMS(z = as.matrix(0:2), L = 1:-1, M = 7, S = 0.1)
zLMS(x = 6.5, L = 1:-1, M = 5:7, S = rep(0.1, 3))




