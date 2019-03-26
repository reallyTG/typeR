library(PAmeasures)


### Name: pam.censor
### Title: Prediction Accuracy Measures for Regression Models of
###   Right-Censored Data
### Aliases: pam.censor

### ** Examples

library(survival)
library(PAmeasures)

# Use Mayo Clinic Primary Biliary Cirrhosis Data
data(pbc)

# Fit an exponential model with bilirubin
fit1 <- survreg(Surv(time, status==2) ~ bili, data = pbc,dist="exponential" )

# Obtain predicted response from the fitted exponential model
predict.time<-predict(fit1,type="response")

# Recode status at endpoint, 0 for censored, 1 for dead
delta.pbc<- as.numeric(pbc$status == 2)

# R.squared and L.squared of log-linear model
pam.censor(pbc$time, predict.time, delta.pbc)



