### R code from vignette source 'CrossVal.Rnw'

###################################################
### code chunk number 1: lib
###################################################
library(CrossValidate)


###################################################
### code chunk number 2: dataset
###################################################
set.seed(123456)
nFeatures <- 1000
nSamples <- 60
pseudoclass <- factor(rep(c("A", "B"), each = 30))
dataset <- matrix(rnorm(nFeatures * nSamples), nrow = nFeatures)


###################################################
### code chunk number 3: nn
###################################################
model <- modeler5NN


###################################################
### code chunk number 4: cv
###################################################
cv <- CrossValidate(model, dataset, pseudoclass, frac = 0.6, nLoop = 30)


###################################################
### code chunk number 5: summary
###################################################
summary(cv)


###################################################
### code chunk number 6: models
###################################################
models <- list(KNN = modeler5NN, CCP = modelerCCP)
results <- lapply(models, CrossValidate,
                  data = dataset, status = pseudoclass,
                  frac = 0.6, nLoop = 30, verbose = FALSE)
lapply(results, summary)


###################################################
### code chunk number 7: daloop
###################################################
pruners <- list(ttest = fsTtest(fdr = 0.05, ming = 100),
                cor = fsPearson(q = 0.90),
                ent = fsEntropy(q = 0.90, kind = "information.gain"))
for (p in pruners) {
  pdata <- dataset[p(dataset, pseudoclass),]
  cv <- CrossValidate(model, pdata, pseudoclass, 0.6, 30, verbose=FALSE)
  show(summary(cv))
}


###################################################
### code chunk number 8: betterloop
###################################################
for (p in pruners) {
  cv <- CrossValidate(model, dataset, pseudoclass, 0.6, 30, 
                      prune=p, verbose=FALSE)
  show(summary(cv))
}


