library(PAmeasures)


### Name: pam.coxph
### Title: Prediction Accuracy Measures for Cox proportional hazards model
### Aliases: pam.coxph

### ** Examples

library(survival)
library(PAmeasures)

# Use Mayo Clinic Primary Biliary Cirrhosis Data
data(pbc)

head(pbc)


# Fit a univariate Cox PH model with standardised blood clotting time
fit1 <- coxph(Surv(time, status==2) ~ protime, data = pbc,x=TRUE,y=TRUE)

# R.squared and L.squared of Cox PH model
pam.coxph(fit1)

# Fit a multiple Cox PH model with bilirubin and standardised blood clotting time
fit2 <- coxph(Surv(time, status==2) ~ bili + protime, data = pbc,x=TRUE,y=TRUE)

# R.squared and L.squared of Cox PH model
pam.coxph(fit2)



