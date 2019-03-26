library(coxrobust)


### Name: coxr
### Title: Fit Robustly Proportional Hazards Regression Model
### Aliases: coxr print.coxr predict.coxr
### Keywords: robust survival

### ** Examples

# Create a simple test data set using the attached function gen_data
a <- gen_data(200, c(1, 0.1, 2), cont = 0.05, p.censor = 0.30)
result <- coxr(Surv(time, status) ~ X1 + X2 + X3, data = a , trunc = 0.9)
result
plot(result)

#use the lung cancer data at Mayo Clinic to
#compare results of non-robust and robust estimation
result <- coxr(Surv(time, status) ~ age + sex + ph.karno + meal.cal + wt.loss, data = lung)
result
plot(result)

#use the Veteran's Administration Lung Cancer Data
#to compare results of non-robust and robust estimation
result <- coxr(Surv(time,status) ~ age + trt + celltype + karno + diagtime + prior, data = veteran)
result
plot(result)



