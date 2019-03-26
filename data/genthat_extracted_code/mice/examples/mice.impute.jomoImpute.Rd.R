library(mice)


### Name: mice.impute.jomoImpute
### Title: Multivariate multilevel imputation using 'jomo'
### Aliases: mice.impute.jomoImpute
### Keywords: datagen

### ** Examples

## No test: 
# Note: Requires mitml 0.3-5.7
blocks <-  list(c("bmi", "chl", "hyp"), "age")
method <- c("jomoImpute", "pmm")
ini <- mice(nhanes, blocks = blocks, method = method, maxit = 0)
pred <- ini$pred
pred["B1", "hyp"] <- -2
imp <- mice(nhanes, blocks = blocks, method = method, pred = pred, maxit = 1)
## End(No test)



