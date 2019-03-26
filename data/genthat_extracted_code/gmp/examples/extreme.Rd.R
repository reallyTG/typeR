library(gmp)


### Name: Extremes
### Title: Extrema (Maxima and Minima)
### Aliases: max.bigz max.bigq min.bigz min.bigq which.max,bigq-method
###   which.max,bigz-method which.min,bigq-method which.min,bigz-method
### Keywords: arith

### ** Examples

 x <- as.bigz(1:10)
 max(x)
 min(x)
 range(x) # works correctly via default method
 x <- x[c(7:10,6:3,1:2)]
 which.min(x) ## 9
 which.max(x) ## 4

 Q <- as.bigq(1:10, 3)
 max(Q)
 min(Q)
 (Q <- Q[c(6:3, 7:10,1:2)])
 stopifnot(which.min(Q) == which.min(asNumeric(Q)),
           which.max(Q) == which.max(asNumeric(Q)))

stopifnot(range(x) == c(1,10), 3*range(Q) == c(1,10))



