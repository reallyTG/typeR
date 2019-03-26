library(uplift)


### Name: performance
### Title: Performance Assessment for Uplift Models
### Aliases: performance
### Keywords: uplift trees

### ** Examples

library(uplift)

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
print(fit1)
summary(fit1)

### get variable importance 

varImportance(fit1, plotit = TRUE, normalize = TRUE)

### predict on new data 

dd_new <- sim_pte(n = 1000, p = 20, rho = 0, sigma =  sqrt(2), beta.den = 4)
dd_new$treat <- ifelse(dd_new$treat == 1, 1, 0)  

pred <- predict(fit1, dd_new)

### evaluate model performance

perf <- performance(pred[, 1], pred[, 2], dd_new$y, dd_new$treat, direction = 1)
plot(perf[, 8] ~ perf[, 1], type ="l", xlab = "Decile", ylab = "uplift")  



