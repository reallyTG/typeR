library(MetaStan)


### Name: meta_stan
### Title: Fitting a meta-analysis model using Stan
### Aliases: meta_stan

### ** Examples

## No test: 
data('dat.Crins2014', package = "MetaStan")
## Subset of dataset where PTLD outcomes available
dat.Crins2014.PTLD = subset(dat.Crins2014, is.finite(exp.PTLD.events))
## Fitting a Binomial-Normal Hierarchial model using vague priors for theta
bnhm.vague.PTLD.stan  <- meta_stan(ntrt = dat.Crins2014.PTLD$exp.total,
                                   nctrl = dat.Crins2014.PTLD$cont.total,
                                   rtrt = dat.Crins2014.PTLD$exp.PTLD.events,
                                   rctrl = dat.Crins2014.PTLD$cont.PTLD.event,
                                   mu_prior = c(0, 10), theta_prior = c(0, 100),
                                   tau_prior =  0.5)
## Obatining a small summary
print(bnhm.vague.PTLD.stan)
## Extract the rstan fit for post-processing, eg convergence diagnostics
bnhm.vague.PTLD.stanfit = bnhm.vague.PTLD.stan$fit
 ## see `?rstan::sampling` for for post-processing of the `stanfit` object
## Fitting a Binomial-Normal Hierarchial model using WIP for theta
bnhm.wip.PTLD.stan  <- meta_stan(ntrt = dat.Crins2014.PTLD$exp.total,
                                   nctrl = dat.Crins2014.PTLD$cont.total,
                                   rtrt = dat.Crins2014.PTLD$exp.PTLD.events,
                                   rctrl = dat.Crins2014.PTLD$cont.PTLD.event,
                                   mu_prior = c(0, 10),
                                   theta_prior = c(0, 2.82),
                                   tau_prior =  0.5)
## Fitting a fixed-effect Binomial model using vague priors for theta
bm.vague.PTLD.stan  <- meta_stan(ntrt = dat.Crins2014.PTLD$exp.total,
                                   nctrl = dat.Crins2014.PTLD$cont.total,
                                   rtrt = dat.Crins2014.PTLD$exp.PTLD.events,
                                   rctrl = dat.Crins2014.PTLD$cont.PTLD.event,
                                   mu_prior = c(0, 10), theta_prior = c(0, 100),
                                   model = "FE")

## Fitting a Beta-binomial model using vague priors
bnhm.wip.PTLD.stan  <- meta_stan(ntrt = dat.Crins2014.PTLD$exp.total,
                                   nctrl = dat.Crins2014.PTLD$cont.total,
                                   rtrt = dat.Crins2014.PTLD$exp.PTLD.events,
                                   rctrl = dat.Crins2014.PTLD$cont.PTLD.event,
                                   model = "Beta-binomial")
## End(No test)




