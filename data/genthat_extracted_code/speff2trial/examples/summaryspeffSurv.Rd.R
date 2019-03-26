library(speff2trial)


### Name: summary.speffSurv
### Title: Summarizing results for semiparametric efficient estimation and
###   testing for a two-sample treatment effect with a right-censored
###   time-to-event endpoint
### Aliases: summary.speffSurv

### ** Examples

### from the example for 'speffSurv':
data <- na.omit(ACTG175[ACTG175$arms<=1 & ACTG175$gender==0,])

fit2 <- speffSurv(Surv(days,cens) ~ cd40+cd80+age+wtkg+drugs+karnof+z30+
preanti+symptom, data=data, trt.id="arms", fixed=TRUE)

summary(fit2)



