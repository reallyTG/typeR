library(uplift)


### Name: tian_transf
### Title: Modify Covariates for Uplift Modeling
### Aliases: tian_transf
### Keywords: uplift

### ** Examples

library(uplift)

set.seed(1)
dd <- sim_pte(n = 1000, p = 20, rho = 0, sigma =  sqrt(2), beta.den = 4)
dd$treat <- ifelse(dd$treat == 1, 1, 0) 

dd2 <- tian_transf(y ~  X1 + X2 + X3 + trt(treat), data =dd, method = "none")
head(dd2)



