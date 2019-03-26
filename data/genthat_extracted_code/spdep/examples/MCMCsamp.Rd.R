library(spdep)


### Name: MCMCsamp
### Title: MCMC sample from fitted spatial regression
### Aliases: MCMCsamp MCMCsamp.spautolm MCMCsamp.sarlm
### Keywords: spatial

### ** Examples

if (require(foreign, quietly=TRUE)) {
example(NY_data, package="spData")
## Not run: 
##D esar1f <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, family="SAR", method="eigen")
##D summary(esar1f)
##D res <- MCMCsamp(esar1f, mcmc=5000, burnin=500, listw=listw_NY)
##D summary(res)
##D esar1fw <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, weights=POP8, family="SAR", method="eigen")
##D summary(esar1fw)
##D res <- MCMCsamp(esar1fw, mcmc=5000, burnin=500, listw=listw_NY)
##D summary(res)
##D ecar1f <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, family="CAR", method="eigen")
##D summary(ecar1f)
##D res <- MCMCsamp(ecar1f, mcmc=5000, burnin=500, listw=listw_NY)
##D summary(res)
##D esar1fw <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, weights=POP8, family="SAR", method="eigen")
##D summary(esar1fw)
##D res <- MCMCsamp(esar1fw, mcmc=5000, burnin=500, listw=listw_NY)
##D summary(res)
##D ecar1fw <- spautolm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, weights=POP8, family="CAR", method="eigen")
##D summary(ecar1fw)
##D res <- MCMCsamp(ecar1fw, mcmc=5000, burnin=500, listw=listw_NY)
##D summary(res)
## End(Not run)
esar0 <- errorsarlm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
 listw=listw_NY)
summary(esar0)
res <- MCMCsamp(esar0, mcmc=5000, burnin=500, listw=listw_NY)
summary(res)
## Not run: 
##D esar0w <- errorsarlm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, weights=POP8)
##D summary(esar0)
##D res <- MCMCsamp(esar0w, mcmc=5000, burnin=500, listw=listw_NY)
##D summary(res)
##D esar1 <- errorsarlm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, etype="emixed")
##D summary(esar1)
##D res <- MCMCsamp(esar1, mcmc=5000, burnin=500, listw=listw_NY)
##D summary(res)
##D lsar0 <- lagsarlm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY)
##D summary(lsar0)
##D res <- MCMCsamp(lsar0, mcmc=5000, burnin=500, listw=listw_NY)
##D summary(res)
##D lsar1 <- lagsarlm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, type="mixed")
##D summary(lsar1)
##D res <- MCMCsamp(lsar1, mcmc=5000, burnin=500, listw=listw_NY)
##D summary(res)
##D ssar0 <- sacsarlm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY)
##D summary(ssar0)
##D res <- MCMCsamp(ssar0, mcmc=5000, burnin=500, listw=listw_NY)
##D summary(res)
##D ssar1 <- sacsarlm(Z ~ PEXPOSURE + PCTAGE65P + PCTOWNHOME, data=nydata,
##D  listw=listw_NY, type="sacmixed")
##D summary(ssar1)
##D res <- MCMCsamp(ssar1, mcmc=5000, burnin=500, listw=listw_NY)
##D summary(res)
## End(Not run)
}



