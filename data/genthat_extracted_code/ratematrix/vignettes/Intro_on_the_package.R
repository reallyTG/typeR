## ------------------------------------------------------------------------
## Load the package
library( ratematrix )
## Load the data
data( "centrarchidae" )
## A list with data, phy.map, and pred
names( centrarchidae )

## ------------------------------------------------------------------------
resp.data <- centrarchidae$data
class( resp.data )
head( resp.data )

## ------------------------------------------------------------------------
pred.data <- centrarchidae$pred
names( pred.data )
## Table show the distribution of the data for the predictor regime.
table( pred.data )

## ------------------------------------------------------------------------
phy <- centrarchidae$phy.map
## Drop the regimes of the stochastic map.
phy <- mergeSimmap(phy, drop.regimes = TRUE)

## ---- echo=FALSE---------------------------------------------------------
load( system.file("extdata", "intro_vignette.RData", package = "ratematrix") )

## ---- eval=FALSE---------------------------------------------------------
#  handle <- ratematrixJointMCMC(data_BM = resp.data, data_Mk = pred.data, phy = phy
#                                , gen = 100000, dir = tempdir())
#  mcmc <- readMCMC(handle)

## ------------------------------------------------------------------------
plotRatematrix(mcmc)

## ---- eval=FALSE---------------------------------------------------------
#  handle2 <- ratematrixJointMCMC(data_BM = resp.data, data_Mk = pred.data, phy = phy
#                                 , gen = 100000, dir = tempdir())
#  mcmc2 <- readMCMC(handle2)

## ------------------------------------------------------------------------
Rfactor <- checkConvergence(mcmc, mcmc2)
Rfactor

## ------------------------------------------------------------------------
merged.mcmc <- mergePosterior(mcmc, mcmc2)

## ------------------------------------------------------------------------
corr <- extractCorrelation(merged.mcmc)
names( corr )
dim( corr$generalist )

## ------------------------------------------------------------------------
hist(x = corr$generalist, xlim = c(-1,1), main = "Generalist", col = "grey"
     , border = "white", breaks = 20, freq = FALSE)
hist(x = corr$specialist, xlim = c(-1,1), main = "Specialist", col = "grey"
     , border = "white", breaks = 20, freq = FALSE)

## ------------------------------------------------------------------------
corr.matrix <- data.frame(corr$generalist, corr$specialist)
colnames(corr.matrix) <- c("generalist", "specialist")
summary(corr.matrix)

## ------------------------------------------------------------------------
testRatematrix(chain = merged.mcmc, par = "rates")

## ------------------------------------------------------------------------
testRatematrix(chain = merged.mcmc, par = "correlation")

## ------------------------------------------------------------------------
names( merged.mcmc )
head( merged.mcmc$root )

## ------------------------------------------------------------------------
names( merged.mcmc$matrix )
class( merged.mcmc$matrix$generalist )
length( merged.mcmc$matrix$generalist )
gen.rate <- merged.mcmc$matrix$generalist
spec.rate <- merged.mcmc$matrix$specialist

## The first element of the list:
gen.rate[[1]]
spec.rate[[1]]

## ------------------------------------------------------------------------
## Extracts the rates for the first trait from the posterior distribution of generalists.
rate.tr1.gen <- sapply(gen.rate, function(x) x[1,1])
summary( rate.tr1.gen )

