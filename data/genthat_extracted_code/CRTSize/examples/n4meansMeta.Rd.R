library(CRTSize)


### Name: n4meansMeta
### Title: Empirical Power and Variance Reduction for an Updated Fixed
###   Effects Meta-Analysis in Cluster Randomized Trials
### Aliases: n4meansMeta print.n4meansMeta summary.n4meansMeta
### Keywords: design

### ** Examples

## Not run: A brief example with 5 iterations.  
n4meansMeta(data=rbind(c(100, 50, 150), c(25, -100, 150), c(-90, -190, 10), c(-125, -200, -50)), 
k=c(10, 20), ICC=c(0.1, 0.15, 0.18), m=100, sdm=0, meanC=100, sdC=10, iter=5, alpha=0.05, 
varRed=TRUE, ICCDistn="smooth");



