library(smfsb)


### Name: rfmc
### Title: Simulate a finite state space Markov chain
### Aliases: rfmc
### Keywords: smfsb

### ** Examples

# example for sampling a finite Markov chain
P = matrix(c(0.9,0.1,0.2,0.8),ncol=2,byrow=TRUE)
pi0 = c(0.5,0.5)
samplepath = rfmc(200,P,pi0)
plot(samplepath)
summary(samplepath)
table(samplepath)
table(samplepath)/length(samplepath) # empirical distribution
# now compute the exact stationary distribution...
e = eigen(t(P))$vectors[,1]
e/sum(e)



