library(Copula.Markov)


### Name: Clayton.Markov.DATA
### Title: Generating Time Series Data Under a Copula-Based Markov Chain
###   Model with the Clayton Copula
### Aliases: Clayton.Markov.DATA
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(1)
Y=Clayton.Markov.DATA(n=1000,mu=0,sigma=1,alpha=8)
Clayton.Markov.MLE(Y,plot=TRUE)



