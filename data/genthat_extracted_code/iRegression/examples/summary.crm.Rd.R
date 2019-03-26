library(iRegression)


### Name: summary.crm
### Title: Summarizing Centre and Range Method Fits
### Aliases: summary.crm
### Keywords: summary crm

### ** Examples

##-- Continuing the  crm() example:
data("Cardiological.CR", package = "iRegression")
ex.crm <- crm(PulseC~SystC+DiastC,PulseR~SystR+DiastR,data=Cardiological.CR)
ex.sum <- summary(ex.crm)
ex.sum



