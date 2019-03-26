library(uplift)


### Name: predict.ccif
### Title: Predictions from a Fitted Causal Conditional Inference Forest
###   Model
### Aliases: predict.ccif
### Keywords: uplift trees

### ** Examples

library(uplift)

### Simulate train data

set.seed(12345)
dd <- sim_pte(n = 100, p = 6, rho = 0, sigma =  sqrt(2), beta.den = 4)
dd$treat <- ifelse(dd$treat == 1, 1, 0) 

### Fit model

form <- as.formula(paste('y ~', 'trt(treat) +', paste('X', 1:6, sep = '', collapse = "+"))) 

fit1 <- ccif(formula = form,
             data = dd, 
             ntree = 50, 
             split_method = "Int",
             pvalue = 0.05,
             verbose = TRUE)

### Predict on new data

dd_new <- sim_pte(n = 200, p = 20, rho = 0, sigma =  sqrt(2), beta.den = 4)

pred <- predict(fit1, dd_new)



