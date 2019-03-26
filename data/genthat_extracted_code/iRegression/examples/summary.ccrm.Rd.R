library(iRegression)


### Name: summary.ccrm
### Title: Summarizing Constrained Centre and Range Method Fits
### Aliases: summary.ccrm
### Keywords: summary ccrm

### ** Examples

##-- Continuing the  ccrm() example:
data("Cardiological.CR", package = "iRegression")
ex.ccrm <- ccrm(PulseC~SystC+DiastC,PulseR~SystR+DiastR,data=Cardiological.CR)
ex.sum <- summary(ex.ccrm)
ex.sum



