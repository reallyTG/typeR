library(survsim)


### Name: crisk.sim
### Title: Generate a cohort in a competing risks context
### Aliases: crisk.sim
### Keywords: survsim individual competing risks survival simulation

### ** Examples

### A cohort with 50 subjects, with a maximum follow-up time of 100 days and two 
### covariates, following Bernoulli distributions, and a corresponding beta of 
### 0.1698695 and 0.0007010932 for each event for the first covariate and a 
### corresponding beta of 0.3735146 and 0.5591244 for each event for the 
### second covariate. Notice that the time to censorship is assumed to follow a 
### log-normal distribution.

sim.data <- crisk.sim(n=50, foltime=100, dist.ev=c("lnorm","lnorm"),
anc.ev=c(1.479687, 0.5268302),beta0.ev=c(3.80342, 2.535374),dist.cens="lnorm",
anc.cens=1.242733,beta0.cens=5.421748,z=list(c("unif", 0.8,1.2), c("unif", 0.9, 1.5)), 
beta=list(c(0.1698695,0.0007010932),c(0.3735146,0.5591244)), 
x=list(c("bern", 0.381), c("bern", 0.564)), nsit=2)

summary(sim.data)



