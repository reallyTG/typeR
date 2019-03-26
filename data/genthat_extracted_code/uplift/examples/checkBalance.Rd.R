library(uplift)


### Name: checkBalance
### Title: Standardized Differences for Stratified Comparisons
### Aliases: checkBalance
### Keywords: uplift xBalance

### ** Examples

library(uplift)

set.seed(12345)
dd <- sim_pte(n = 1000, p = 20, rho = 0, sigma =  sqrt(2), beta.den = 4)
dd$treat <- ifelse(dd$treat == 1, 1, 0) 

checkBalance(treat ~ X1 + X2 + X3 + X4 + X5 + X6 , data = dd)



