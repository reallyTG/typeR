library(PrevMap)


### Name: linear.model.Bayes
### Title: Bayesian estimation for the geostatistical linear Gaussian model
### Aliases: linear.model.Bayes

### ** Examples

set.seed(1234)
data(loaloa)
# Empirical logit transformation
loaloa$logit <- log((loaloa$NO_INF+0.5)/(loaloa$NO_EXAM-loaloa$NO_INF+0.5))

cp <- control.prior(beta.mean=-2.3,beta.covar=20,
                             log.normal.sigma2=c(0.9,5),
                             log.normal.phi=c(-0.17,2),
                             log.normal.nugget=c(-1,1))
control.mcmc <- control.mcmc.Bayes(n.sim=10,burnin=0,thin=1,
                           h.theta1=0.5,h.theta2=0.5,h.theta3=0.5,
                           c1.h.theta3=0.01,c2.h.theta3=0.0001,linear.model=TRUE,
                           start.beta=-2.3,start.sigma2=2.45,
                           start.phi=0.65,start.nugget=0.34)
fit.Bayes <- linear.model.Bayes(logit ~ 1,coords=~LONGITUDE+LATITUDE,
                data=loaloa,kappa=0.5, control.mcmc=control.mcmc,
                control.prior = cp)
summary(fit.Bayes)



