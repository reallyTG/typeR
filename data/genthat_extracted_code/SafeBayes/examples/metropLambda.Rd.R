library(SafeBayes)


### Name: metropLambda
### Title: Metropolis-Hastings algorithm to sample lambda with a Beta prior
###   for the Bayesian Lasso
### Aliases: metropLambda
### Keywords: SafeBayes

### ** Examples

rm(list=ls())
library(SafeBayes)
tau2 <- 1/4
lambda <- 50

metropLambda(tau2=tau2, lambda=lambda)



