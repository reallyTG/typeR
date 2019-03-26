library(smallarea)


### Name: maximlikelihood
### Title: Maximum likelihood estimates of the variance components and the
###   unknown regression coefficients in Fay Herriot Model.
### Aliases: maximlikelihood
### Keywords: fay Herriot small area estimation variance component maximum
###   likelihood

### ** Examples

response=c(1,2,3,4,5)
designmatrix=cbind(c(1,1,1,1,1),c(1,2,4,4,1),c(2,1,3,1,5))
randomeffect.var=c(0.5,0.7,0.8,0.4,0.5)
maximlikelihood(response,designmatrix,randomeffect.var)



