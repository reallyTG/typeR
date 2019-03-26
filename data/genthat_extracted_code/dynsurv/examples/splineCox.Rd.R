library(dynsurv)


### Name: splineCox
### Title: Fit Spline Based Cox Model for Right Censored Survival Data
### Aliases: splineCox
### Keywords: B-spline Cox censor right

### ** Examples

## Not run: 
##D ## Attach the veteran data from the survival package
##D mydata <- survival::veteran
##D mydata$celltype <- relevel(mydata$celltype, ref = "large")
##D myformula <- Surv(time, status) ~ karno + celltype
##D 
##D ## Fit the time-varying transformation model
##D fit <- splineCox(myformula, mydata, control = list(df = 5))
##D 
##D ## Plot the time-varying coefficient function between two time points
##D plotCoef(subset(coef(fit), Time > 15 & Time < 175), smooth = TRUE)
## End(Not run)



