library(bayess)


### Name: hmhmm
### Title: Estimation of a hidden Markov model with 2 hidden and 4 observed
###   states
### Aliases: hmhmm likej
### Keywords: hidden Markov model forward-backward algorithm

### ** Examples

res=hmhmm(M=500,y=sample(1:4,10,rep=TRUE))
plot(res$olike,type="l",main="log-likelihood",xlab="iterations",ylab="")



