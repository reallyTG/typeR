library(speff2trial)


### Name: speffSurv
### Title: Semiparametric efficient estimation and testing for a two-sample
###   treatment effect with a right-censored time-to-event endpoint
### Aliases: speffSurv

### ** Examples

str(ACTG175)

data <- na.omit(ACTG175[ACTG175$arms<=1 & ACTG175$gender==0,])

### efficiency-improved estimation of log hazard ratio using
### baseline covariates
fit1 <- speffSurv(Surv(days,cens) ~ cd40+cd80+age+wtkg+drugs+karnof+z30+
preanti+symptom, data=data, trt.id="arms")

### 'fit2' coerces the use of all specified baseline covariates;
### automated selection procedure is skipped
fit2 <- speffSurv(Surv(days,cens) ~ cd40+cd80+age+wtkg+drugs+karnof+z30+
preanti+symptom, data=data, trt.id="arms", fixed=TRUE)



