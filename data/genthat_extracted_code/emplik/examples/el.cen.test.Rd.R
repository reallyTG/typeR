library(emplik)


### Name: el.cen.test
### Title: Empirical likelihood ratio for mean with right censored data, by
###   QP.
### Aliases: el.cen.test
### Keywords: nonparametric survival htest

### ** Examples

el.cen.test(rexp(100), c(rep(0,25),rep(1,75)), mu=1.5)
## second example with tied observations
x <- c(1, 1.5, 2, 3, 4, 5, 6, 5, 4, 1, 2, 4.5)
d <- c(1,   1, 0, 1, 0, 1, 1, 1, 1, 0, 0,   1)
el.cen.test(x,d,mu=3.5)
# we should get  "-2LLR" = 1.246634  etc. 



