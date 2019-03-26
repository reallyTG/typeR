library(Copula.Markov)


### Name: Joe.Markov.DATA
### Title: Generating Time Series Data Under a Copula-Based Markov Chain
###   Model with the Joe Copula
### Aliases: Joe.Markov.DATA
### Keywords: ~kwd1 ~kwd2

### ** Examples

n=1000
alpha=2.856 ### Kendall's tau =0.5 ###
mu=2
sigma=1
Y=Joe.Markov.DATA(n,mu,sigma,alpha)
mean(Y)
sd(Y)
cor(Y[-1],Y[-n],method="kendall")

Joe.Markov.MLE(Y,k=2)



