library(coxed)


### Name: generate.lm
### Title: Generate simulated durations using a baseline survivor function
###   and proportional hazards
### Aliases: generate.lm

### ** Examples

baseline <- baseline.build(T=100, knots=8, spline=TRUE)
simdata <- generate.lm(baseline, N=1000, xvars=5, mu=0, sd=1, type="none", censor=.1)
summary(simdata$data)
simdata <- generate.lm(baseline, N=1000, xvars=5, mu=0, sd=1, type="tvc", censor=.1)
summary(simdata$data)
simdata <- generate.lm(baseline, N=1000, xvars=5, mu=0, sd=1, type="tvbeta", censor=.1)
simdata$beta



