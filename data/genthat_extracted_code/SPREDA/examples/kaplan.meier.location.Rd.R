library(SPREDA)


### Name: kaplan.meier.location
### Title: Kaplan-Meier Location
### Aliases: kaplan.meier.location

### ** Examples

require(survival)
fit <- survfit(Surv(time, status) ~ x, data = aml)
kaplan.meier.location(fit)



