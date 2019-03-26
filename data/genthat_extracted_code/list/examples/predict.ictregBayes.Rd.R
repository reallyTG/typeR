library(list)


### Name: predict.ictregBayes
### Title: Predict Method for the Item Count Technique with Bayesian MCMC
### Aliases: predict.ictregBayes
### Keywords: models regression

### ** Examples


data(race)

## Not run: 
##D 
##D bayes.fit <- ictregBayes(y ~ age + college + male + south, data = multi, 
##D   treat = "treat", delta.tune = diag(.002, 5), psi.tune = diag(.00025, 5))
##D 
##D bayes.predict <- predict(bayes.fit, interval = "confidence", se.fit = TRUE)
##D 
## End(Not run)





