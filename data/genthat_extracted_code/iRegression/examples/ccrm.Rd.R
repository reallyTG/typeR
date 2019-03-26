library(iRegression)


### Name: ccrm
### Title: Constrained Centre and Range Method
### Aliases: ccrm ccrm.default ccrm.formula
### Keywords: ccrm

### ** Examples

data("Cardiological.CR", package = "iRegression")
ex.ccrm <- ccrm("PulseC~SystC+DiastC","PulseR~SystR+DiastR",data=Cardiological.CR)
ex.ccrm



