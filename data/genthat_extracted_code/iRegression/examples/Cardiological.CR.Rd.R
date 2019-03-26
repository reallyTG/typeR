library(iRegression)


### Name: Cardiological.CR
### Title: Cardiological Interval Data Set (Centre and Range)
### Aliases: Cardiological.CR
### Keywords: datasets

### ** Examples

data("Cardiological.CR", package = "iRegression")

crm1 <- crm("PulseC~SystC+DiastC","PulseR~SystR+DiastR",data=Cardiological.CR)
summary(crm1)



