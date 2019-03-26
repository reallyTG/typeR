## ------------------------------------------------------------------------
library( ratematrix )
library( geiger )

## ------------------------------------------------------------------------
phy <- sim.bdtree(b=1, d=0, stop="taxa", n=100)
R <- rbind(c(0.5, 0.2),
           c(0.2, 0.5) )
dat <- simRatematrix(tree=phy, vcv=R, anc=c(5,10))

## ------------------------------------------------------------------------
## Create a matrix the bounds for the uniform prior. 
## Here will use the max and min of the tip data as bounds.
par.mu <- rbind( ceiling( range(dat[,1]) ), ceiling( range(dat[,2]) ) )
## Using a lognormal prior on the standard deviations, with log(mean)=0 and log(sd)=1.5.
par.sd <- c(0, 1.5)
## Prior on the covariance matrix is set to the default: 
##          marginally uniform on the covariances.
unif.prior <- makePrior(r = 2, p = 1, den.mu = "unif", par.mu = par.mu, den.sd = "lnorm"
                        , par.sd = par.sd)

## ---- fig.height=4, fig.width=4------------------------------------------
samples <- samplePrior(n = 1000, prior = unif.prior)
## Plot the prior samples between -10 and 10.
plotRatematrix(samples, set.xlim = c(-10,10))

## ---- eval=FALSE---------------------------------------------------------
#  handle.unif.root <- ratematrixMCMC(data=dat, phy=phy, prior=unif.prior
#                                     , start="prior_sample", gen=200000
#                                     , outname="uniform_root_prior", dir=tempdir() )

## ---- echo=FALSE---------------------------------------------------------
load( system.file("extdata", "unif.root.RData", package = "ratematrix") )

## ---- eval=2-------------------------------------------------------------
post.unif.root <- readMCMC(handle=handle.unif.root)
## Check the posterior object:
post.unif.root
checkConvergence(post.unif.root)

## ---- fig.height=4, fig.width=6------------------------------------------
plotPrior(handle=handle.unif.root, root=TRUE)

## ---- fig.height=4, fig.width=4------------------------------------------
plotPrior(handle=handle.unif.root, set.xlim=c(-10,10))

## ---- fig.height=4, fig.width=6------------------------------------------
plotRootValue(post.unif.root, vline.values = c(5,10), vline.color = c("red","red"))

## ------------------------------------------------------------------------
## Generate a matrix with the parameters for a normal distribution for the root values.
## Root_1: mean 0 and sd 1 and Root_2: mean 15 and sd 2.
par.mu <- rbind( c(0, 1), c(15, 2) )
## Using a lognormal prior on the standard deviations, with log(mean)=0 and log(sd)=1.5.
par.sd <- c(0, 1.5)
## Prior on the covariance matrix is set to the default: 
##       marginally uniform on the covariances.
norm.prior <- makePrior(r = 2, p = 1, den.mu = "norm", par.mu = par.mu, den.sd = "lnorm"
                        , par.sd = par.sd)

## ---- eval=FALSE---------------------------------------------------------
#  handle.norm.root <- ratematrixMCMC(data=dat, phy=phy, prior=norm.prior
#                                     , start="prior_sample", gen=200000
#                                     , outname="normal_root_prior", prop=c(0.1,0.45,0.45)
#                                     , dir=tempdir() )

## ---- echo=FALSE---------------------------------------------------------
load( system.file("extdata", "norm.root.RData", package = "ratematrix") )

## ---- eval=2-------------------------------------------------------------
post.norm.root <- readMCMC(handle=handle.norm.root)
checkConvergence(post.norm.root)

## ---- fig.height=4, fig.width=6------------------------------------------
plotPrior(handle=handle.norm.root, root=TRUE)
plotRootValue(post.norm.root, vline.values = c(5,10), vline.color = c("red","red"))

## ------------------------------------------------------------------------
## Check the summary and quartiles for the prior distributions.
## Prior for trait 1:
summary( rnorm(1000, 0, 1) )
## Prior for trait 2:
summary( rnorm(1000, 15, 2) )

## ---- fig.height=4, fig.width=4------------------------------------------
plotPrior(handle.unif.root, n = 10000, root = FALSE, set.xlim=c(-10,10), alphaEll=0.5)

## ---- fig.height=4, fig.width=4, fig.show="hold"-------------------------
ss <- samplePrior(n=1000, prior=unif.prior, sample.sd = TRUE, rebuild.R = FALSE)
corr <- sapply(ss$matrix, function(x) cov2cor(x)[1,2] )
hist( corr, main="Correlation between traits")
hist( ss$sd[,1], main="Standard deviation - trait 1")
hist( ss$sd[,2], main="Standard deviation - trait 2")

## ---- fig.height=4, fig.width=4------------------------------------------
plotRatematrix(chain=post.unif.root, set.leg = c("trait_1", "trait_2")
               , point.matrix = list(R), point.color = "red", point.wd = 1.5)

## ------------------------------------------------------------------------
## Create a matrix with the bounds for the uniform prior. 
## Here will use the max and min of the tip data as bounds.
par.mu <- rbind( ceiling( range(dat[,1]) ), ceiling( range(dat[,2]) ) )
## Using a lognormal prior on the standard deviations, with log(mean)=0 and log(sd)=1.5.
par.sd <- c(0,1.5)
## Sigma is a scale matrix. This is equivalent to the mean of a inverse-Wishart.
## An identity matrix will center the distribution on 0 correlation.
Sigma <- rbind( c(1, 0),
                c(0, 1) )
## nu is the equivalent of the variance of this distribution. But here large values mean
##    most of the samples will be close to the Sigma matrix whereas small values 
##    (min = number of traits +1) will result in a more spread distribution.
nu <- 50 ## This will constrain the distribution around the Sigma matrix.
corr.prior <- makePrior(r = 2, p = 1, den.mu = "unif", par.mu = par.mu, den.sd = "lnorm"
                        , par.sd = par.sd, unif.corr = FALSE, Sigma = Sigma, nu = nu)

## ---- fig.height=4, fig.width=4, fig.show="hold"-------------------------
ss.corr <- samplePrior(n = 1000, prior=corr.prior, sample.sd = TRUE, rebuild.R = FALSE)
corr.p <- sapply(ss.corr$matrix, function(x) cov2cor(x)[1,2] )
hist( corr.p, main="Correlation between traits")
hist( ss.corr$sd[,1], main="Standard deviation - trait 1")
hist( ss.corr$sd[,2], main="Standard deviation - trait 2")

## ------------------------------------------------------------------------
cov2cor(R)[1,2]

## ---- fig.height=4, fig.width=4, fig.show="hold"-------------------------
plotRatematrix(ss.corr, set.xlim = c(-10,10), show.zero = TRUE)

## ---- echo=FALSE---------------------------------------------------------
load( system.file("extdata", "corr.zero.RData", package = "ratematrix") )

## ---- fig.height=4, fig.width=4, eval=c(3,4)-----------------------------
handle.corr.zero <- ratematrixMCMC(data=dat, phy=phy, prior=corr.prior
                                   , start="prior_sample", gen=200000
                                   , outname="corr_zero_prior", prop=c(0.1,0.45,0.45)
                                   , dir=tempdir() )
post.corr.zero <- readMCMC(handle=handle.corr.zero)
checkConvergence(post.corr.zero)
plotRatematrix(post.corr.zero, point.matrix = list(R), point.color = "red", point.wd = 1.5
               , show.zero = TRUE)

