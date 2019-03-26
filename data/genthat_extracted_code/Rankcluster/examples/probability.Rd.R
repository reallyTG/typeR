library(Rankcluster)


### Name: probability
### Title: Probability computation
### Aliases: probability

### ** Examples

m=c(4,5)
x=mu=matrix(nrow=1,ncol=9)
x[1:4] = c(1,4,2,3)
x[5:9] = c(3,5,2,4,1)
mu[1:4] = 1:4
mu[5:9] = c(3,5,4,2,1)
pi=c(0.75,0.82)

prob=probability(x,mu,pi,m)
prob



