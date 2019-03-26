library(MaskJointDensity)


### Name: mask
### Title: Core function the Data Provider uses to mask the confidential
###   original data to give to the user
### Aliases: mask
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

set.seed(123)
n=10000
y <- rmulti(n=10000, mean=c(30, 50), sd=c(4,2), p=c(0.3, 0.7))
      # y is a sample drawn from Y.
noise<-rmulti(n=10000, mean=c(80, 100), sd=c(5,3), p=c(0.6, 0.4))
      # noise is a sample drawn from C.
a1<-runif(1, min=min(y)-2,max=min(y))
b1<-runif(1, min=max(y), max=max(y)+2)
ymask<-mask(vectorToBeMasked = y, noisefile=file.path(tempdir(),"noise.bin"), noise,
lowerBoundAsGivenByProvider=a1, upperBoundAsGivenByProvider=b1)
write(ymask$ystar, file.path(tempdir(),"ystar.dat"))



