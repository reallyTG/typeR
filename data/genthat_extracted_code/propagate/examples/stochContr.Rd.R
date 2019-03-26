library(propagate)


### Name: stochContr
### Title: Stochastic contribution analysis of Monte Carlo
###   simulation-derived propagated uncertainty
### Aliases: stochContr
### Keywords: matrix multivariate algebra

### ** Examples

a <- c(15, 1)
b <- c(100, 5)
c <- c(0.5, 0.02)
DAT <- cbind(a, b, c)
EXPR <- expression(a * b^sin(c))
RES <- propagate(EXPR, DAT, nsim = 100000)
stochContr(RES)



