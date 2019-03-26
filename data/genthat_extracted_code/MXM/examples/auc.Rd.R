library(MXM)


### Name: ROC and AUC
### Title: ROC and AUC
### Aliases: auc
### Keywords: Area under the curve receiver operating curve

### ** Examples

# simulate a dataset with continuous data
g <- rbinom(150, 1, 0.6)
f <- rnorm(150)
auc(g, f, roc = FALSE)



