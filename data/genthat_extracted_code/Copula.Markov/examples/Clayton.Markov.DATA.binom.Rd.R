library(Copula.Markov)


### Name: Clayton.Markov.DATA.binom
### Title: Generating Time Series Data Under a Copula-Based Markov Chain
###   Model with the Clayton Copula and Binomial Margin.
### Aliases: Clayton.Markov.DATA.binom
### Keywords: ~kwd1 ~kwd2

### ** Examples

size=50
prob=0.5
alpha=2
set.seed(1)
Y=Clayton.Markov.DATA.binom(n=500,size,prob,alpha)
### sample mean and SD ###
mean(Y)
sd(Y)
### true mean and SD ###
size*prob
sqrt(size*prob*(1-prob))



