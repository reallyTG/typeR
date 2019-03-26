library(CRTSize)


### Name: n4meansEB
### Title: Number of Subjects Required for a Cluster Randomized Trial with
###   a Continuous Outcome Using Empirical Smoothing
### Aliases: n4meansEB print.n4meansEB summary.n4meansEB
### Keywords: design

### ** Examples

## Not run: 
##D ICC values are from Rotondi and Donner (2009).  Suppose classrooms of size 25 are randomized 
##D with hypothetical experimental rates of 0.05 and control rates of 0.18.  Plots are suppressed, 
##D and iter = 50 for testing purposes.
## End(Not run)
n4meansEB(delta=0.5, sigma=1, m=25, ICC=c(0.162, 0.205, 0.234, 0.253), 
varICC= c(0.030, 0.032, 0.010, 0.026)^2, from=0.15, to=0.28, iter=50, plot=FALSE);



