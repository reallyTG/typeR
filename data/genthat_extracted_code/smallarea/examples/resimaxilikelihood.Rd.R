library(smallarea)


### Name: resimaxilikelihood
### Title: Estimate of the variance component in Fay Herriot Model using
###   Residual Maximum Likelihood, REML.
### Aliases: resimaxilikelihood
### Keywords: fay Herriot small area estimation variance component REML
###   residual maximum likelihood

### ** Examples

response=c(1,2,3,4,5)
designmatrix=cbind(c(1,1,1,1,1),c(1,2,4,4,1),c(2,1,3,1,5))
randomeffect.var=c(0.5,0.7,0.8,0.4,0.5)
resimaxilikelihood(response,designmatrix,randomeffect.var,100)



