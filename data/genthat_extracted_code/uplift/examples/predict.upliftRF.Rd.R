library(uplift)


### Name: predict.upliftRF
### Title: Predictions from a Fitted Uplift Random Forest Model
### Aliases: predict.upliftRF
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
                 minsplit = 200, # need small trees as there is strong uplift effects in the data
                 verbose = TRUE)
summary(fit1)

### predict on new data 

dd_new <- sim_pte(n = 2000, p = 20, rho = 0, sigma =  sqrt(2), beta.den = 4)
dd_new$treat <- ifelse(dd_new$treat == 1, 1, 0)  

pred <- predict(fit1, dd_new)     
head(pred)




