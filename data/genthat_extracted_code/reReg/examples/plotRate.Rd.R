library(reReg)


### Name: plotRate
### Title: Plotting the Baseline Cumulative Rate Function for the Recurrent
###   Event Process
### Aliases: plotRate
### Keywords: Plots

### ** Examples

## readmission data
data(readmission, package = "frailtypack")
set.seed(123)
fit <- reReg(reSurv(t.stop, id, event, death) ~ sex + chemo,
                   data = subset(readmission, id < 50),
                   method = "am.XCHWY", se = "resampling", B = 20)
## Plot both the baseline cumulative rate and hazard function
plot(fit)
## Plot baseline cumulative rate function
plotRate(fit)
## Plot with user-specified labels
plotRate(fit, xlab = "User xlab", ylab = "User ylab", main = "User title")
plotRate(fit, control = list(xlab = "User xlab", ylab = "User ylab", main = "User title"))



