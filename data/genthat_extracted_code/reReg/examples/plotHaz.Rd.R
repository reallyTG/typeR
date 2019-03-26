library(reReg)


### Name: plotHaz
### Title: Produce the Baseline Cumulative Hazard Function for the
###   Censoring Time
### Aliases: plotHaz
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
## Plot baseline cumulative hazard function
plotHaz(fit)
## Plot with user-specified labels
plotHaz(fit, control = list(xlab = "User xlab", ylab = "User ylab", main = "User title"))  



