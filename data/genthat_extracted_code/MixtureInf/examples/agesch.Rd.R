library(MixtureInf)


### Name: agesch
### Title: age of onset of schizophrenia
### Aliases: agesch
### Keywords: datasets

### ** Examples

#fit a finite normal mixture model of order 2 to this data set,
#plot the histogram of the observations and the fitted density function.
data(agesch)
out <- pmle.norm(agesch,2,1)
plotmix.norm(agesch,out)



