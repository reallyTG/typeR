library(mice)


### Name: mice.impute.panImpute
### Title: Impute multilevel missing data using 'pan'
### Aliases: mice.impute.panImpute
### Keywords: datagen

### ** Examples

blocks <-  list(c("bmi", "chl", "hyp"), "age")
method <- c("panImpute", "pmm")
ini <- mice(nhanes, blocks = blocks, method = method, maxit = 0)
pred <- ini$pred
pred["B1", "hyp"] <- -2
imp <- mice(nhanes, blocks = blocks, method = method, pred = pred, maxit = 1)




