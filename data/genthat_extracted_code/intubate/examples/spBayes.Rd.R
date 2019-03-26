library(intubate)


### Name: spBayes
### Title: Interfaces for spBayes package for data science pipelines.
### Aliases: ntbt_bayesGeostatExact ntbt_bayesLMConjugate ntbt_spDynLM
### Keywords: intubate magrittr spBayes bayesGeostatExact bayesLMConjugate
###   spDynLM

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(spBayes)
##D 
##D ## NOTE: Just interfacing 3 functions as a proof of concept. However,
##D ##       there are so many things declared and used, that I am not sure if
##D ##       everything could be passed on a pipeline (perhaps with intuBags down the line).
##D ##       I may get back to it later.
##D 
##D ## ntbt_bayesGeostatExact: Simple Bayesian spatial linear model with fixed semivariogram parameters
##D data(FORMGMT.dat)
##D 
##D n <- nrow(FORMGMT.dat)
##D p <- 5 ##an intercept an four covariates
##D 
##D n.samples <- 50
##D 
##D phi <- 0.0012
##D 
##D coords <- cbind(FORMGMT.dat$Longi, FORMGMT.dat$Lat)
##D coords <- coords*(pi/180)*6378
##D 
##D beta.prior.mean <- rep(0, times=p)
##D beta.prior.precision <- matrix(0, nrow=p, ncol=p)
##D 
##D alpha <- 1/1.5
##D 
##D sigma.sq.prior.shape <- 2.0
##D sigma.sq.prior.rate <- 10.0
##D 
##D 
##D ## Original function to interface
##D bayesGeostatExact(Y ~ X1 + X2 + X3 + X4, data = FORMGMT.dat,
##D                   n.samples = n.samples,
##D                   beta.prior.mean = beta.prior.mean,
##D                   beta.prior.precision = beta.prior.precision,
##D                   coords = coords, phi = phi, alpha = alpha,
##D                   sigma.sq.prior.shape = sigma.sq.prior.shape,
##D                   sigma.sq.prior.rate = sigma.sq.prior.rate)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bayesGeostatExact(FORMGMT.dat, Y ~ X1 + X2 + X3 + X4,
##D                        n.samples = n.samples,
##D                        beta.prior.mean = beta.prior.mean,
##D                        beta.prior.precision = beta.prior.precision,
##D                        coords = coords, phi = phi, alpha = alpha,
##D                        sigma.sq.prior.shape = sigma.sq.prior.shape,
##D                        sigma.sq.prior.rate = sigma.sq.prior.rate)
##D 
##D ## so it can be used easily in a pipeline.
##D FORMGMT.dat %>%
##D   ntbt_bayesGeostatExact(Y ~ X1 + X2 + X3 + X4,
##D                          n.samples = n.samples,
##D                          beta.prior.mean = beta.prior.mean,
##D                          beta.prior.precision = beta.prior.precision,
##D                          coords = coords, phi = phi, alpha = alpha,
##D                          sigma.sq.prior.shape = sigma.sq.prior.shape,
##D                          sigma.sq.prior.rate = sigma.sq.prior.rate)
##D 
##D 
##D 
##D 
##D ## ntbt_bayesLMConjugate: Simple Bayesian linear model via the Normal/inverse-Gamma conjugate
##D n <- nrow(FORMGMT.dat)
##D p <- 7 ##an intercept and six covariates
##D 
##D n.samples <- 500
##D 
##D ## Below we demonstrate the conjugate function in the special case
##D ## with improper priors. The results are the same as for the above,
##D ## up to MC error. 
##D beta.prior.mean <- rep(0, times=p)
##D beta.prior.precision <- matrix(0, nrow=p, ncol=p)
##D 
##D prior.shape <- -p/2
##D prior.rate <- 0
##D 
##D ## Original function to interface
##D bayesLMConjugate(Y ~ X1 + X2 + X3 + X4 + X5 + X6, data = FORMGMT.dat,
##D                  n.samples, beta.prior.mean,
##D                  beta.prior.precision,
##D                  prior.shape, prior.rate)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bayesLMConjugate(FORMGMT.dat, Y ~ X1 + X2 + X3 + X4 + X5 + X6,
##D                       n.samples, beta.prior.mean,
##D                       beta.prior.precision,
##D                       prior.shape, prior.rate)
##D 
##D ## so it can be used easily in a pipeline.
##D FORMGMT.dat %>%
##D   ntbt_bayesLMConjugate(Y ~ X1 + X2 + X3 + X4 + X5 + X6,
##D                         n.samples, beta.prior.mean,
##D                         beta.prior.precision,
##D                         prior.shape, prior.rate)
##D 
##D 
##D ## ntbt_spDynLM: Function for fitting univariate Bayesian dynamic
##D ##               space-time regression models
##D data("NETemp.dat")
##D ne.temp <- NETemp.dat
##D 
##D set.seed(1)
##D 
##D ##take a chunk of New England
##D ne.temp <- ne.temp[ne.temp[,"UTMX"] > 5500000 & ne.temp[,"UTMY"] > 3000000,]
##D 
##D ##subset first 2 years (Jan 2000 - Dec. 2002)
##D y.t <- ne.temp[,4:27]
##D N.t <- ncol(y.t) ##number of months
##D n <- nrow(y.t) ##number of observation per months
##D 
##D ##add some missing observations to illistrate prediction
##D miss <- sample(1:N.t, 10)
##D holdout.station.id <- 5
##D y.t.holdout <- y.t[holdout.station.id, miss]
##D y.t[holdout.station.id, miss] <- NA
##D 
##D ##scale to km
##D coords <- as.matrix(ne.temp[,c("UTMX", "UTMY")]/1000)
##D max.d <- max(iDist(coords))
##D 
##D ##set starting and priors
##D p <- 2 #number of regression parameters in each month
##D 
##D starting <- list("beta"=rep(0,N.t*p), "phi"=rep(3/(0.5*max.d), N.t),
##D                  "sigma.sq"=rep(2,N.t), "tau.sq"=rep(1, N.t),
##D                  "sigma.eta"=diag(rep(0.01, p)))
##D 
##D tuning <- list("phi"=rep(5, N.t)) 
##D 
##D priors <- list("beta.0.Norm"=list(rep(0,p), diag(1000,p)),
##D                "phi.Unif"=list(rep(3/(0.9*max.d), N.t), rep(3/(0.05*max.d), N.t)),
##D                "sigma.sq.IG"=list(rep(2,N.t), rep(10,N.t)),
##D                "tau.sq.IG"=list(rep(2,N.t), rep(5,N.t)),
##D                "sigma.eta.IW"=list(2, diag(0.001,p)))
##D 
##D ##make symbolic model formula statement for each month
##D mods <- lapply(paste(colnames(y.t),'elev',sep='~'), as.formula)
##D 
##D n.samples <- 10 # in original example it is 2000.
##D 
##D ## Original function to interface
##D spDynLM(mods, data=cbind(y.t,ne.temp[,"elev",drop=FALSE]), coords=coords,
##D         starting=starting, tuning=tuning, priors=priors, get.fitted =TRUE,
##D         cov.model="exponential", n.samples=n.samples, n.report=25) 
##D 
##D ## The interface puts data as first parameter
##D ntbt_spDynLM(cbind(y.t,ne.temp[,"elev",drop=FALSE]), mods, coords=coords,
##D              starting=starting, tuning=tuning, priors=priors, get.fitted =TRUE,
##D              cov.model="exponential", n.samples=n.samples, n.report=25) 
##D 
##D ## so it can be used easily in a pipeline.
##D cbind(y.t,ne.temp[,"elev",drop=FALSE]) %>%
##D   ntbt_spDynLM(mods, coords=coords,
##D                starting=starting, tuning=tuning, priors=priors, get.fitted =TRUE,
##D                cov.model="exponential", n.samples=n.samples, n.report=25) 
## End(Not run)



