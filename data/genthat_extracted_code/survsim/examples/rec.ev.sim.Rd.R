library(survsim)


### Name: rec.ev.sim
### Title: Generate a cohort with recurrent events
### Aliases: rec.ev.sim
### Keywords: survsim individual recurrent survival simulation

### ** Examples

### A cohort with 500 subjects, with a maximum follow-up time of 1825 days and 
### just a covariate, following a Bernoulli distribution, and a corresponding 
### beta of -0.4, -0.5, -0.6 and -0.7 for each episode. Note that random effect is
### the same for all events.

sim.data <- rec.ev.sim(n=500, foltime=1825, dist.ev=c('lnorm','llogistic', 
'weibull','weibull'),anc.ev=c(1.498, 0.924, 0.923, 1.051),beta0.ev=c(7.195, 
6.583, 6.678, 6.430),,anc.cens=c(1.272, 1.218, 1.341, 1.484),
beta0.cens=c(7.315, 6.975, 6.712, 6.399), z=list(c("unif", 0.8,1.2)), 
beta=list(c(-0.4,-0.5,-0.6,-0.7)), x=list(c("bern", 0.5)),
lambda=c(2.18,2.33,2.40,3.46), priskb=0.5, max.old=730)

summary(sim.data)



