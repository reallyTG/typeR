library(BAS)


### Name: summary.bas
### Title: Summaries of Bayesian Model Averaging objects from BAS
### Aliases: summary.bas summary
### Keywords: print regression

### ** Examples

data(UScrime, package = "MASS")
UScrime[, -2] <- log(UScrime[, -2])
crime.bic <- bas.lm(y ~ ., data = UScrime, n.models = 2^15, prior = "BIC", initprobs = "eplogp")
print(crime.bic)
summary(crime.bic)



