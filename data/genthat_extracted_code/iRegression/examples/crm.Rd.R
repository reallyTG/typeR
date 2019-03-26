library(iRegression)


### Name: crm
### Title: Centre and Range Method
### Aliases: crm crm.default crm.formula
### Keywords: crm

### ** Examples

data("Cardiological.CR", package = "iRegression")
ex.crm <- crm("PulseC~SystC+DiastC","PulseR~SystR+DiastR",data=Cardiological.CR)
ex.crm



