library(MBESS)


### Name: ss.aipe.smd.sensitivity
### Title: Sensitivity analysis for sample size given the Accuracy in
###   Parameter Estimation approach for the standardized mean difference.
### Aliases: ss.aipe.smd.sensitivity
### Keywords: design htest

### ** Examples

# Since 'true.delta' equals 'estimated.delta', this usage 
# returns the results of a correctly specified situation.
# Note that 'G' should be large (50 is used to make the example run easily)
# Res.1 <- ss.aipe.smd.sensitivity(true.delta=.5, estimated.delta=.5, 
# desired.width=.30, certainty=NULL, conf.level=.95, G=50,
# print.iter=FALSE)

# Lists contained in Res.1.
# names(Res.1) 

#Objects contained in the 'Results' lists.
# names(Res.1$Results) 

#Extract d from the Results list of Res.1.
# d <- Res.1$Results$d 

# hist(d)

# Pull out summary measures
# Res.1$Summary

# True standardized mean difference is .4, but specified at .5.
# Change 'G' to some large number (e.g., G=5,000)
# Res.2 <- ss.aipe.smd.sensitivity(true.delta=.4, estimated.delta=.5, 
# desired.width=.30, certainty=NULL, conf.level=.95, G=50, 
# print.iter=FALSE)

# The effect of the misspecification on mean confidence intervals is:
# Res.2$Summary$mean.full.width

# True standardized mean difference is .5, but specified at .4.
# Res.3 <- ss.aipe.smd.sensitivity(true.delta=.5, estimated.delta=.4, 
# desired.width=.30, certainty=NULL, conf.level=.95, G=50, 
# print.iter=FALSE)

# The effect of the misspecification on mean confidence intervals is:
# Res.3$Summary$mean.full.width



