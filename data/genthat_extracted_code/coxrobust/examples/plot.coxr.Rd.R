library(coxrobust)


### Name: plot.coxr
### Title: Plot Diagnostics for a coxr Object
### Aliases: plot.coxr
### Keywords: hplot robust survival

### ** Examples

#use the lung cancer data at Mayo Clinic 
#to compare results of non-robust and robust estimation
result <- coxr(Surv(time, status) ~ age + sex + ph.karno + meal.cal + wt.loss, data = lung)
plot(result, main = "Mayo Clinic Lung Cancer Data")



