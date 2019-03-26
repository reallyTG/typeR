library(infotheo)


### Name: discretize
### Title: Unsupervized Data Discretization
### Aliases: discretize
### Keywords: misc

### ** Examples

data(USArrests)
nbins<- sqrt(NROW(USArrests))
ew.data <- discretize(USArrests,"equalwidth", nbins)
ef.data <- discretize(USArrests,"equalfreq", nbins)
gew.data <- discretize(USArrests,"globalequalwidth", nbins)



