library(speff2trial)


### Name: summary.speff
### Title: Summarizing results for semiparametric efficient estimation and
###   testing for a 2-sample treatment effect
### Aliases: summary.speff

### ** Examples

### from the example for 'speff':
fit1 <- speff(cd496 ~ age+wtkg+hemo+homo+drugs+karnof+oprior+preanti+
race+gender+str2+strat+symptom+cd40+cd420+cd80+cd820+offtrt,
postrandom=c("cd420","cd820","offtrt"), data=ACTG175, trt.id="treat")

summary(fit1)



