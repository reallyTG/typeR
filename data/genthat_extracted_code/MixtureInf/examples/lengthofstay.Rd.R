library(MixtureInf)


### Name: lengthofstay
### Title: length of stay
### Aliases: lengthofstay
### Keywords: datasets

### ** Examples

#fit a 2 component exponential model to this data set, 
#plot the histogram of the observations and the fitted density.
data(lengthofstay)
out <- pmle.exp(lengthofstay,2,1)
plotmix.exp(lengthofstay,out)



