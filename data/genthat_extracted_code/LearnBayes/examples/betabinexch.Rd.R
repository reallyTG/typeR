library(LearnBayes)


### Name: betabinexch
### Title: Log posterior of logit mean and log precision for Binomial/beta
###   exchangeable model
### Aliases: betabinexch
### Keywords: models

### ** Examples

n=c(20,20,20,20,20)
y=c(1,4,3,6,10)
data=cbind(y,n)
theta=c(-1,0)
betabinexch(theta,data)



