library(mice)


### Name: mice.mids
### Title: Multivariate Imputation by Chained Equations (Iteration Step)
### Aliases: mice.mids
### Keywords: iteration

### ** Examples


imp1 <- mice(nhanes, maxit=1, seed = 123)
imp2 <- mice.mids(imp1)

# yields the same result as
imp <- mice(nhanes, maxit=2, seed = 123)

# verification
identical(imp$imp, imp2$imp)
# 



