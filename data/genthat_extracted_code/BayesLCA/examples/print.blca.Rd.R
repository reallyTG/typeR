library(BayesLCA)


### Name: print.blca
### Title: Bayesian Latent Class Analysis
### Aliases: print.blca
### Keywords: blca print

### ** Examples


data(Alzheimer)
fit1<- blca(Alzheimer, 2, method="em")
class(fit1)
print(fit1)
fit2<- blca(Alzheimer, 2, method="em", sd=TRUE)
print(fit2) ## Standard Errors also printed

fit3<- blca(Alzheimer, 2, method="vb")
print(fit3) ## Standard Errors as standard



