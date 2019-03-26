library(BAS)


### Name: print.bas
### Title: Print a Summary of Bayesian Model Averaging objects from BAS
### Aliases: print.bas print
### Keywords: print regression

### ** Examples


library(MASS)
data(UScrime)
UScrime[, -2] <- log(UScrime[, -2])
crime.bic <- bas.lm(y ~ ., data = UScrime, n.models = 2^15, prior = "BIC", initprobs = "eplogp")
print(crime.bic)
summary(crime.bic)



