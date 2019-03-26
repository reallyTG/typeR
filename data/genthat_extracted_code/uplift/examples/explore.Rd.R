library(uplift)


### Name: explore
### Title: Explore Data for Uplift Modeling
### Aliases: explore
### Keywords: uplift trees

### ** Examples

library(uplift)

set.seed(12345)
dd <- sim_pte(n = 1000, p = 20, rho = 0, sigma =  sqrt(2), beta.den = 4)
dd$treat <- ifelse(dd$treat == 1, 1, 0) 

eda <- explore(y ~ X1 + X2 + X3 + X4 + X5 + X6 + trt(treat), data = dd)            



