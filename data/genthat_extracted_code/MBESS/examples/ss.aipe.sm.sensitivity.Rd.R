library(MBESS)


### Name: ss.aipe.sm.sensitivity
### Title: Sensitivity analysis for sample size planning for the
###   standardized mean from the Accuracy in Parameter Estimation (AIPE)
###   Perspective
### Aliases: ss.aipe.sm.sensitivity
### Keywords: design htest

### ** Examples

# Since 'true.sm' equals 'estimated.sm', this usage
# returns the results of a correctly specified situation.
# Note that 'G' should be large (10 is used to make the 
# example run easily)
# Res.1 <- ss.aipe.sm.sensitivity(true.sm=10, estimated.sm=10, 
# desired.width=.5, assurance=.95, conf.level=.95, G=10,
# print.iter=FALSE)

# Lists contained in Res.1.
# names(Res.1) 

#Objects contained in the 'Results' lists.
# names(Res.1$Results) 

#How many obtained full widths are narrower than the desired one?
# Res.1$Summary$Pct.Width.obs.NARROWER.than.desired

# True standardized mean difference is 10, but specified at 12.
# Change 'G' to some large number (e.g., G=20)
# Res.2 <- ss.aipe.sm.sensitivity(true.sm=10, estimated.sm=12, 
# desired.width=.5, assurance=NULL, conf.level=.95, G=20)

# The effect of the misspecification on mean confidence intervals is:
# Res.2$Summary$mean.full.width




