library(flood)


### Name: hill
### Title: Hill's estimator
### Aliases: hill

### ** Examples

library("evd")
x1 <- rgev(100, loc = 2, scale = 1, shape=0.4)
hill(x1, k=20)
x2 <- rgev(100, loc = 2, scale = 1, shape=0.5)
hill(cbind(x1, x2), k = c(20, 25))
x2[c(4,8,39)] <- NA
hill(cbind(x1, x2), k=c(20, 25))
# if leaving out k, it will be set to floor(2*n^(2/3)/d^(1/3)) = c(34,33):
hill(cbind(x1, x2)) # is the same as:
hill(cbind(x1, x2), k=c(34,33))



