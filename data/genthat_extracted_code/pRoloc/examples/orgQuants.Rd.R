library(pRoloc)


### Name: orgQuants
### Title: Returns organelle-specific quantile scores
### Aliases: orgQuants

### ** Examples

library("pRolocdata")
data(dunkley2006)
res <- svmClassification(dunkley2006, fcol = "pd.markers",
                         sigma = 0.1, cost = 0.5)
## 50% top predictions per class
ts <- orgQuants(res, fcol = "svm", t = .5)
getPredictions(res, fcol = "svm", t = ts)



