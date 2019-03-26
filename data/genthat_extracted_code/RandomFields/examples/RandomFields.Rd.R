library(RandomFields)


### Name: RandomFields-package
### Title: Simulation and Analysis of Random Fields
### Aliases: RandomFields RandomFields-package
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample(reduced=FALSE)
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

# simulate some data first (Gaussian random field with exponential
# covariance; 6 realisations)
model <- RMexp()
x <- seq(0, 10, 0.1)
z <- RFsimulate(model, x, x, n=6)

## select some data from the simulated data
xy <- coordinates(z)
pts <- sample(nrow(xy), min(100, nrow(xy) / 2))
dta <- matrix(nrow=nrow(xy), as.vector(z))[pts, ]
dta <- cbind(xy[pts, ], dta)
plot(z, dta)


## re-estimate the parameter (true values are 1)
estmodel <- RMexp(var=NA, scale=NA)
(fit <- RFfit(estmodel, data=dta))

## show a kriged field based on the estimated parameters
kriged <- RFinterpolate(fit, x, x, data=dta)
plot(kriged, dta)

## Don't show: 
FinalizeExample()
## End(Don't show)


