library(PAmeasures)


### Name: pam.survreg
### Title: Prediction Accuracy Measures for Parametric Survival Regression
###   Models
### Aliases: pam.survreg

### ** Examples

library(survival)
library(PAmeasures)

# Use Mayo Clinic Primary Biliary Cirrhosis Data
data(pbc)

head(pbc)

# Fit an exponential model with bilirubin
fit1 <- survreg(Surv(time, status==2) ~ bili, data = pbc,dist="exponential",x=TRUE,y=TRUE)

# R.squared and L.squared of exponential model
pam.survreg(fit1)

# Fit a lognormal model with standardised blood clotting time
fit2 <- survreg(Surv(time, status==2) ~ protime, data = pbc,dist="lognormal",x=TRUE,y=TRUE)

# R.squared and L.squared of lognormal model
pam.survreg(fit2)

# Fit a weibull model with bilirubin and standardised blood clotting time
fit3 <- survreg(Surv(time, status==2) ~ bili + protime, data = pbc,dist="weibull",x=TRUE,y=TRUE)

# R.squared and L.squared of weibull model
pam.survreg(fit3)



