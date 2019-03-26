## ------------------------------------------------------------------------
library( ratematrix )

## ------------------------------------------------------------------------
data( "centrarchidae" )
## Using a function to drop all the regimes in the phylogeny to create a simpler case.
phy <- mergeSimmap( centrarchidae$phy.map, drop.regimes = TRUE)
par_mu <- t( apply(centrarchidae$data, 2, range) )
prior <- makePrior(r = 2, p = 1, par.mu = par_mu, par.sd = c(0, sqrt(10)))
one.regime.sample <- samplePrior(n = 1, prior = prior)

## ------------------------------------------------------------------------
par.sd <- rbind( c(0, sqrt(10)), c(0, sqrt(10)) )
two.regime.prior <- makePrior(r = 2, p = 2, par.mu = par_mu, par.sd = par.sd)
two.regime.sample <- samplePrior(n = 1, prior = two.regime.prior)

## ------------------------------------------------------------------------
data( anoles )
anoles.phy <- anoles$phy[[1]]

## ---- eval=FALSE---------------------------------------------------------
#  anoles.single.regime <- mergeSimmap(phy = anoles.phy, drop.regimes = TRUE)
#  handle <- ratematrixMCMC(data=anoles$data[,1:3], phy=anoles.single.regime, gen=500000
#                           , dir=tempdir() )
#  mcmc <- readMCMC(handle, thin = 200)

## ---- echo=FALSE---------------------------------------------------------
load( system.file("extdata", "mcmc.start.point.tutorial.RData", package = "ratematrix") )

## ------------------------------------------------------------------------
plotRatematrix(mcmc)

## ------------------------------------------------------------------------
mcmc

## ------------------------------------------------------------------------
names( mcmc )

## ------------------------------------------------------------------------
class( mcmc$root )
dim( mcmc$root )

## ------------------------------------------------------------------------
class( mcmc$matrix )
length( mcmc$matrix )
mcmc$matrix[[1]]

## ------------------------------------------------------------------------
id <- sample(x = 1:length(mcmc$matrix), size = 2)
( root <- as.numeric( mcmc$root[id[1],] ) ) ## Just one sample.
( R <- mcmc$matrix[id] ) ## Two samples in our case.

## ------------------------------------------------------------------------
library( corpcor )
corr <- lapply(R, function(x) decompose.cov(x)[[1]] )
var <- lapply(R, function(x) decompose.cov(x)[[2]] )
( start <- list(root = root, matrix = corr, sd = var) )

## ---- eval=FALSE---------------------------------------------------------
#  undebug( ratematrixMCMC )
#  ( custom.start.handle <- ratematrixMCMC(data=anoles$data[,1:3], phy=anoles.phy, start=start
#                                          , gen=1000, dir=tempdir()) )
#  

## ---- echo=FALSE---------------------------------------------------------
load( system.file("extdata", "handle.start.point.tutorial.RData", package = "ratematrix") )
custom.start.handle

