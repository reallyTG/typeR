library(LearnBayes)


### Name: laplace
### Title: Summarization of a posterior density by the Laplace method
### Aliases: laplace
### Keywords: models

### ** Examples

logpost=function(theta,data)
{
s=5
sum(-log(1+(data-theta)^2/s^2))
}
data=c(10,12,14,13,12,15)
start=10
laplace(logpost,start,data)



