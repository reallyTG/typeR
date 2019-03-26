library(mr.raps)


### Name: mr.raps
### Title: Main function
### Aliases: mr.raps mr.raps.all mr.raps.simple mr.raps.overdispersed
###   mr.raps.simple.robust mr.raps.overdispersed.robust

### ** Examples


data(bmi.sbp)
attach(bmi.sbp)

## All estimators
mr.raps.all(beta.exposure, beta.outcome, se.exposure, se.outcome)

## Diagnostic plots
res <- mr.raps(beta.exposure, beta.outcome, se.exposure, se.outcome,
diagnosis = TRUE)
res <- mr.raps(beta.exposure, beta.outcome, se.exposure, se.outcome,
TRUE, diagnosis = TRUE)
res <- mr.raps(beta.exposure, beta.outcome, se.exposure, se.outcome,
TRUE, "tukey", diagnosis = TRUE)

detach(bmi.sbp)

data(bmi.bmi)
attach(bmi.bmi)

## Because both the exposure and the outcome are BMI, the true "causal" effect should be 1.

## All estimators
mr.raps.all(beta.exposure, beta.outcome, se.exposure, se.outcome)

detach(bmi.bmi)




