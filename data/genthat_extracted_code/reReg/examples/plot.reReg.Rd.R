library(reReg)


### Name: plot.reReg
### Title: Plotting Baseline Cumulative Rate Function and Baseline
###   Cumulative Hazard Function
### Aliases: plot.reReg
### Keywords: Plots

### ** Examples

data(readmission, package = "frailtypack")
fit <- reReg(reSurv(t.stop, id, event, death) ~ sex + chemo,
             data = subset(readmission, id < 50))
plot(fit)
plot(fit, baseline = "rate")
plot(fit, baseline = "rate", xlab = "Time (days)")



