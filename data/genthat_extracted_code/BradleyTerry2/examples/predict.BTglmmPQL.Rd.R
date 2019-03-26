library(BradleyTerry2)


### Name: predict.BTglmmPQL
### Title: Predict Method for BTglmmPQL Objects
### Aliases: predict.BTglmmPQL
### Keywords: models

### ** Examples


seedsModel <- glmmPQL(cbind(r, n - r) ~ seed + extract,
                      random = diag(nrow(seeds)),
                      family = binomial,
                      data = seeds)

pred <- predict(seedsModel, level = 0)
predTerms <- predict(seedsModel, type = "terms")

all.equal(pred, rowSums(predTerms) + attr(predTerms, "constant"))




