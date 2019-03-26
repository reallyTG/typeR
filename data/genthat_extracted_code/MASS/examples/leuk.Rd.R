library(MASS)


### Name: leuk
### Title: Survival Times and White Blood Counts for Leukaemia Patients
### Aliases: leuk
### Keywords: datasets

### ** Examples

library(survival)
plot(survfit(Surv(time) ~ ag, data = leuk), lty = 2:3, col = 2:3)

# now Cox models
leuk.cox <- coxph(Surv(time) ~ ag + log(wbc), leuk)
summary(leuk.cox)



