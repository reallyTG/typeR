library(survsim)


### Name: simple.surv.sim
### Title: Generate a cohort with single-event survival times
### Aliases: simple.surv.sim
### Keywords: survsim individual single survival simulation

### ** Examples

### A cohort with 1000 subjects, with a maximum follow-up time of 3600 days and two 
### covariates, following a Bernoulli and uniform distribution respectively, and a 
### corresponding beta of -0.4 for the first covariate and a corresponding beta of 0
### for the second covariate. Notice that the time to censorship is assumed to 
### follow a Weibull distribution, as no other distribution is stated.

sim.data <- simple.surv.sim(n=1000, foltime=3600, dist.ev=c('llogistic'),
anc.ev=c(0.69978200185280),beta0.ev=c(5.84298525742252),,anc.cens=1.17783687569519,
beta0.cens=7.39773677281100,z=list(c("unif", 0.8, 1.2)), beta=list(c(-0.4),
c(0)), x=list(c("bern", 0.5), c("unif", 0.7, 1.3)))

summary(sim.data)



