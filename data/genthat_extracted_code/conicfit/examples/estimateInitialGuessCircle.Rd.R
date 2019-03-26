library(conicfit)


### Name: estimateInitialGuessCircle
### Title: Estimate Initial Guess Circle values
### Aliases: estimateInitialGuessCircle
### Keywords: datasets

### ** Examples

xy<-calculateCircle(0,0,200,50,randomDist=TRUE,noiseFun=function(x) (x+rnorm(1,mean=0,sd=50)))
estimateInitialGuessCircle(xy)



