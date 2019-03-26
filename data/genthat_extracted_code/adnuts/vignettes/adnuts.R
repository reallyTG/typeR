## ---- eval=TRUE, echo=FALSE----------------------------------------------
library(adnuts)
## library(rstan)
fit.admb <- readRDS('fit.admb.RDS')

## ------------------------------------------------------------------------
mon <- rstan::monitor(fit.admb$samples, print=FALSE)
mon[1:4,'n_eff']
mon[1:4,'Rhat']

## ------------------------------------------------------------------------
post <- extract_samples(fit.admb)
str(post[,1:5])
sp <- extract_sampler_params(fit.admb)
str(sp)

## ---- eval=FALSE, echo=FALSE---------------------------------------------
#  post <- extract_samples(fit.admb, as.list=TRUE)
#  postlist <- coda::mcmc.list(lapply(post, coda::mcmc))
#  coda::traceplot(postlist)

## ----fig1, fig.width=6, fig.height=4.5-----------------------------------
slow <-  c("sigmayearphi", "yeareffphi_raw[3]", "yeareffphi_raw[2]",
           "yeareffphi_raw[4]", "yeareffphi_raw[1]")
pairs_admb(fit.admb, pars=slow)

