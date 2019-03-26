library(SpatialEpi)


### Name: EBpostthresh
### Title: Produce the probabilities of exceeding a threshold given a
###   posterior gamma distribution.
### Aliases: EBpostthresh
### Keywords: file

### ** Examples

data(scotland)
Y <- scotland$data$cases
E <- scotland$data$expected
ebresults <- eBayes(Y,E)
# Find probabilities of exceedence of 3
thresh3 <- EBpostthresh(Y, E, alpha=ebresults$alpha, beta=ebresults$beta,
rrthresh=3)
mapvariable(thresh3, scotland$spatial.polygon)



