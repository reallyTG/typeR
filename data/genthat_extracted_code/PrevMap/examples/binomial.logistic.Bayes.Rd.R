library(PrevMap)


### Name: binomial.logistic.Bayes
### Title: Bayesian estimation for the binomial logistic model
### Aliases: binomial.logistic.Bayes

### ** Examples

set.seed(1234)
data(data_sim)
# Select a subset of data_sim with 50 observations
n.subset <- 50
data_subset <- data_sim[sample(1:nrow(data_sim),n.subset),]
# Set the MCMC control parameters
control.mcmc <- control.mcmc.Bayes(n.sim=10,burnin=0,thin=1,
                           h.theta1=0.05,h.theta2=0.05,
                           L.S.lim=c(1,50),epsilon.S.lim=c(0.01,0.02),
                           start.beta=0,start.sigma2=1,start.phi=0.15,
                           start.nugget=NULL,
                           start.S=rep(0,n.subset))

cp <- control.prior(beta.mean=0,beta.covar=1,
                    log.normal.phi=c(log(0.15),0.05),
                    log.normal.sigma2=c(log(1),0.1))

fit.Bayes <- binomial.logistic.Bayes(formula=y~1,coords=~x1+x2,units.m=~units.m,
                                     data=data_subset,control.prior=cp,
                                     control.mcmc=control.mcmc,kappa=2)
summary(fit.Bayes)

par(mfrow=c(2,4))
autocor.plot(fit.Bayes,param="S",component.S="all")
autocor.plot(fit.Bayes,param="beta",component.beta=1)
autocor.plot(fit.Bayes,param="sigma2")
autocor.plot(fit.Bayes,param="phi")
trace.plot(fit.Bayes,param="S",component.S=30)
trace.plot(fit.Bayes,param="beta",component.beta=1)
trace.plot(fit.Bayes,param="sigma2")
trace.plot(fit.Bayes,param="phi")



