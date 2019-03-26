library(zCompositions)


### Name: splineKM
### Title: Display Kaplan-Meier empirical cumulative distribution function
###   and smoothing spline curve fit
### Aliases: splineKM
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(Water)
data(mdl)

# Examine default spline smoothed KM ECDF fit for Potassium and Sulphate
splineKM(Water[,1],label=0,mdl[,1])
splineKM(Water[,4],label=0,mdl[,4],xlim=c(28,41))

# Reduce to 5 knots for Potassium
splineKM(Water[,1],label=0,mdl[,1],n.knots=5)



