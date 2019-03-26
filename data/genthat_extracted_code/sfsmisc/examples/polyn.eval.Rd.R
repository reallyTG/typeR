library(sfsmisc)


### Name: polyn.eval
### Title: Evaluate Polynomials
### Aliases: polyn.eval
### Keywords: arith

### ** Examples

polyn.eval(c(1,-2,1), x = 0:3)# (x - 1)^2
polyn.eval(c(0, 24, -50, 35, -10, 1), x = matrix(0:5, 2,3))# 5 zeros!
(cf <- rbind(diag(3), c(1,-2,1)))
polyn.eval(cf, 0:5)



