library(markovchain)


### Name: expectedRewards
### Title: Expected Rewards for a markovchain
### Aliases: expectedRewards

### ** Examples

transMatr<-matrix(c(0.99,0.01,0.01,0.99),nrow=2,byrow=TRUE)
simpleMc<-new("markovchain", states=c("a","b"),
             transitionMatrix=transMatr)
expectedRewards(simpleMc,1,c(0,1))



