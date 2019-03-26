library(FMStable)


### Name: stableParameters
### Title: Setting up Parameters to Describe both Extremal Stable
###   Distributions and Finite Moment Log Stable Distributions
### Aliases: stableParameters stable setParam setMomentsFMstable
###   fitGivenQuantile matchQuartiles print.stableParameters
### Keywords: distribution

### ** Examples

setParam(alpha=1.5, location=1, logscale=-.6, pm="M")
setParam(alpha=.4, location=1, logscale=-.6, pm="M")
setMomentsFMstable(alpha=1.7, mean=.5, sd=.2)
fitGivenQuantile(mean=5, sd=1, prob=.001, value=.01, tol=1.e-10)
fitGivenQuantile(mean=20, sd=1, prob=1.e-20, value=1, tol=1.e-24)
matchQuartiles(quartiles=c(9,11), alpha=1.8)



