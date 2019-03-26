library(bda)


### Name: gld
### Title: The mixed normal distribution
### Aliases: gld fmkl dgld qgld rgld pgld
### Keywords: distribution

### ** Examples


 lambdas <- c(33,1.4,-1.5,-.6)
 rgld(3,lambdas)
 qgld(c(0,.1,.3,.5,.8,.9,1),lambdas)
 pgld(c(25,30,34,35,40), lambdas)
 dgld(c(25,30,34,35,40), lambdas)




