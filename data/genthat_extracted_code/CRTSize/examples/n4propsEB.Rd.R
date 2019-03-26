library(CRTSize)


### Name: n4propsEB
### Title: Number of Subjects Required for a Cluster Randomized Trial with
###   Binary Outcomes Using Empirical Smoothing
### Aliases: n4propsEB print.n4propsEB summary.n4propsEB
### Keywords: design

### ** Examples

## Not run: 
##D ICC values are from Rotondi and Donner (2009).  Suppose classrooms of size 25 
##D are randomized with hypothetical experimental rates of 0.05 and control rates of 0.18. 
##D Plots are suppressed, and iter = 50 for testing purposes.
## End(Not run)
n4propsEB(pe=0.10, pc=0.18, m=25, ICC=c(0.162, 0.205, 0.234, 0.253), 
varICC= c(0.030, 0.032, 0.010, 0.026)^2, from=0.15, to=0.28, iter=50, plot=FALSE);



