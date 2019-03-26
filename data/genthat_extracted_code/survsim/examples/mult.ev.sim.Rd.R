library(survsim)


### Name: mult.ev.sim
### Title: Generate a cohort with multiple events
### Aliases: mult.ev.sim
### Keywords: survsim individual multiple survival simulation

### ** Examples

### A cohort with 1000 subjects, with a maximum follow-up time of 3600 days and two 
### covariates, following a Bernoulli and uniform distribution respectively, and a 
### corresponding beta of -0.4, -0.5, -0.6 and -0.7 for each event for the first 
### covariate and a corresponding beta of 0, 0, 0 and 1 for each event for the 
### second covariate. Notice that the time to censorship is assumed to follow a 
### Weibull distribution, as no other distribution is stated and random effect is
### the same for all events.

sim.data <- mult.ev.sim(n=1000, foltime=3600, dist.ev=c('llogistic','weibull', 
'weibull','weibull'),anc.ev=c(0.69978200185280, 0.79691659193027, 
0.82218416457321, 0.85817155198598),beta0.ev=c(5.84298525742252, 5.94362650803287,
5.78182528904637, 5.46865223339755),,anc.cens=1.17783687569519,
beta0.cens=7.39773677281100,z=list(c("unif", 0.8,1.2)), beta=list(c(-0.4,-0.5,-0.6,-0.7),
c(0,0,0,1)), x=list(c("bern", 0.5), c("unif", 0.7, 1.3)), nsit=4)

summary(sim.data)



