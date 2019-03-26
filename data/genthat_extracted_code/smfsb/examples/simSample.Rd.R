library(smfsb)


### Name: simSample
### Title: Simulate a many realisations of a model at a given fixed time in
###   the future given an initial time and state, using a function
###   (closure) for advancing the state of the model
### Aliases: simSample
### Keywords: smfsb

### ** Examples

out3 = simSample(100,c(x1=50,x2=100),0,20,stepLVc)
hist(out3[,"x2"])



