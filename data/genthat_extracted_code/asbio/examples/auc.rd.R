library(asbio)


### Name: auc
### Title: Area under a receiver operating characteristic (ROC) curve
### Aliases: auc

### ** Examples

obs <-rbinom(30, 1, 0.5)
fit <- rbeta(30, 1, 2)

auc(obs, fit)



