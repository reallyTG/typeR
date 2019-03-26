library(uplift)


### Name: varImportance
### Title: Extract Variable Importance from 'upliftRF' or 'ccif' Fitted
###   Objects
### Aliases: varImportance varImportance.default varImportance.upliftRF
### Keywords: uplift trees

### ** Examples

library(uplift)

### simulate data for uplift modeling

set.seed(123)
dd <- sim_pte(n = 1000, p = 20, rho = 0, sigma =  sqrt(2), beta.den = 4)
dd$treat <- ifelse(dd$treat == 1, 1, 0) 

### fit uplift random forest

fit1 <- upliftRF(y ~ X1 + X2 + X3 + X4 + X5 + X6 + trt(treat),
                 data = dd, 
                 mtry = 3,
                 ntree = 100, 
                 split_method = "KL",
                 minsplit = 200, 
                 verbose = TRUE)
print(fit1)

### get variable importance 

varImportance(fit1, plotit = TRUE, normalize = TRUE)



