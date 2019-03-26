library(LearnBayes)


### Name: betabinexch0
### Title: Log posterior of mean and precision for Binomial/beta
###   exchangeable model
### Aliases: betabinexch0
### Keywords: models

### ** Examples

n=c(20,20,20,20,20)
y=c(1,4,3,6,10)
data=cbind(y,n)
theta=c(.1,10)
betabinexch0(theta,data)



