library(bhrcr)


### Name: summary.bhrcr
### Title: Summary Statistics for the Bayesian Clearance Estimator
### Aliases: summary.bhrcr

### ** Examples

data("posterior")
summary(posterior)
## Don't show: 
data("pursat")
data("pursat_covariates")
data = pursat[pursat["id"] <= 80 & pursat["id"] > 70,]
covariates = pursat_covariates[71:80,]
out <- clearanceEstimatorBayes(data = data, covariates = covariates, outlier.detect = TRUE,
                              niteration = 3, burnin = 1, thin = 1)
summary(out)
## End(Don't show)
## No test: 
data("pursat")
data("pursat_covariates")
out <- clearanceEstimatorBayes(data = pursat, covariates = pursat_covariates, 
                               niteration = 200, burnin = 50, thin = 10)
summary(out)
## End(No test)



