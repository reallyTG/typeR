library(CRTSize)


### Name: n4propsMeta
### Title: Empirical Power and Variance Reduction of an Updated Fixed
###   Effects Meta-Analysis with Binary Outcomes
### Aliases: n4propsMeta print.n4propsMeta summary.n4propsMeta
### Keywords: design

### ** Examples

## Not run: A brief example with 10 iterations.
n4propsMeta(data=rbind(c(0.672, 0.342, 1.321), c(0.942, 0.761, 1.165), c(1.228, 0.384, 3.934)), 
k=c(10, 20, 30), ICC=c(0.1, 0.15, 0.14), m=10, sdm=0, pC=0.1, sdpC=0, iter=10, alpha=0.05, 
varRed=TRUE, ICCDistn="unif");



