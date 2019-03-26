library(LearnBayes)


### Name: weibullregpost
### Title: Log posterior of a Weibull proportional odds model for survival
###   data
### Aliases: weibullregpost
### Keywords: models

### ** Examples

data(chemotherapy)
attach(chemotherapy)
d=cbind(time,status,treat-1,age)
theta=c(-.6,11,.6,0)
weibullregpost(theta,d)



