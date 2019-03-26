library(projpred)


### Name: cv-indices
### Title: Create cross-validation indices
### Aliases: cv-indices cvfolds cvind

### ** Examples

## No test: 
### compute sample means within each fold
n <- 100
y <- rnorm(n)
cv <- cvind(n, k=5)
cvmeans <- lapply(cv, function(fold) mean(y[fold$tr]))
## End(No test)




