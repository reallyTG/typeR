library(Copula.Markov)


### Name: Clayton.Markov.MLE.binom
### Title: Maximum Likelihood Estimation and Statistical Process Control
###   Under the Clayton Copula
### Aliases: Clayton.Markov.MLE.binom
### Keywords: ~kwd1 ~kwd2

### ** Examples

size=50
prob=0.5
alpha=2
set.seed(1)
Y=Clayton.Markov.DATA.binom(n=500,size,prob,alpha)
Clayton.Markov.MLE.binom(Y,size=size,k=3,plot=TRUE)



