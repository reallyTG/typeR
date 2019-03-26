library(MLPUGS)


### Name: ecc
### Title: Fit an Ensemble of Classifier Chains (ECC)
### Aliases: ecc

### ** Examples

x <- movies_train[, -(1:3)]
y <- movies_train[, 1:3]

fit <- ecc(x, y, m = 1, .f = glm.fit, family = binomial(link = "logit"))

## Not run: 
##D 
##D fit <- ecc(x, y, .f = randomForest::randomForest)
##D 
##D fit <- ecc(x, y, m = 7, .f = C50::C5.0, trials = 10)
## End(Not run)



