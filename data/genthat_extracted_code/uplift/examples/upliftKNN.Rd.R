library(uplift)


### Name: upliftKNN
### Title: Uplift k-Nearest Neighbor
### Aliases: upliftKNN
### Keywords: uplift tree

### ** Examples

library(uplift)

### simulate data for uplift modeling

set.seed(1)

train <- sim_pte(n = 500, p = 10, rho = 0, sigma =  sqrt(2), beta.den = 4)
train$treat <- ifelse(train$treat == 1, 1, 0) 

### Fit an Uplift k-Nearest Neighbor on test data

test <- sim_pte(n = 100, p = 10, rho = 0, sigma =  sqrt(2), beta.den = 4)
test$treat <- ifelse(test$treat == 1, 1, 0) 

fit1 <- upliftKNN(train[, 3:8], test[, 3:8], train$y, train$treat, k = 1, 
          dist.method = "euclidean", p = 2, ties.meth = "min",   agg.method = "majority")
head(fit1)          



