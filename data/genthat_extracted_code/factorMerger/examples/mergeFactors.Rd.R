library(factorMerger)


### Name: mergeFactors
### Title: Merge factors
### Aliases: mergeFactors mergeFactor.default

### ** Examples

rSample <- generateMultivariateSample(N = 100, k = 10, d = 3)

rSample$covariates <- runif(100)
rSample$weights <- runif(100)
mergeFactors(response = rSample$response, factor = rSample$factor)
mergeFactors(response = rSample$response, factor = rSample$factor, 
    covariates = rSample$covariates)
mergeFactors(rSample$response[,1], rSample$factor, 
    covariates = rSample$covariates, weights = rSample$weights)
dataset <- cbind(rSample$response, rSample$factor, rSample$covariates)
colnames(dataset) <- c("res1","res2","res3","fct", "cov1")

formula <- as.formula("res1+res2+res3~fct")
formulaCovariates <-as.formula("res1+res2+res3~fct+cov1")
mergeFactors(response = formula, factor="fct", data=dataset)
mergeFactors(response = formulaCovariates, factor="fct", data=dataset)




