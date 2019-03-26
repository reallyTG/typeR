library(MixtureInf)


### Name: plotmix.exp
### Title: Histogram of the observations and the fitted density of a
###   mixture of exponentials
### Aliases: plotmix.exp
### Keywords: dplot

### ** Examples

#load the lengthofstay data set,
#fit a 2 compoent exponential mixture model, 
#plot the histogram of the observations and the fitted density.
data(lengthofstay)
out <- pmle.exp(lengthofstay,2)
plotmix.exp(lengthofstay,out)



