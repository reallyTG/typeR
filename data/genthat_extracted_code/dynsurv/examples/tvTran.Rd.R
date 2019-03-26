library(dynsurv)


### Name: tvTran
### Title: Fit Time-varying Transformation Model for Right Censored
###   Survival Data
### Aliases: tvTran
### Keywords: censor right transformation

### ** Examples

## Not run: 
##D ## Attach the veteran data from the survival package
##D mydata <- survival::veteran
##D mydata$celltype <- relevel(mydata$celltype, ref = "large")
##D myformula <- Surv(time, status) ~ karno + celltype
##D 
##D ## Fit the time-varying transformation model
##D fit <- tvTran(myformula, mydata, control = list(resample = TRUE, R = 30))
##D 
##D ## Plot the time-varying coefficient function between two time points
##D plotCoef(subset(coef(fit), Time > 15 & Time < 175))
## End(Not run)



