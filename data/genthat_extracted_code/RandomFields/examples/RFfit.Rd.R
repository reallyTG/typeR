library(RandomFields)


### Name: RFfit
### Title: Fitting model parameters to spatial data (regionalised
###   variables) and to linear (mixed) models
### Aliases: RFfit RFfit.default
### Keywords: spatial optimize

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

RFoptions(modus_operandi="sloppy")


#########################################################
## simulate some data first                            ## 
points <- 100
x <- runif(points, 0, 3)
y <- runif(points, 0, 3) ## random points in square [0, 3]^2
model <- RMgencauchy(alpha=1, beta=2)
d <- RFsimulate(model, x=x, y=y, grid=FALSE, n=100) #1000


#########################################################
## estimation; 'NA' means: "to be estimated"           ##
estmodel <- RMgencauchy(var=NA, scale=NA, alpha=NA, beta=2) +
            RMtrend(mean=NA)
RFfit(estmodel, data=d)


#########################################################
## coupling alpha and beta                             ##
estmodel <- RMgencauchy(var=NA, scale=NA, alpha=NA, beta=NA) + 
            RMtrend(NA)
RFfit(estmodel, data=d, transform = NA) ## just for information
trafo <- function(a) c(a[1], rep(a[2], 2))
fit <- RFfit(estmodel, data=d,
             transform = list(c(TRUE, TRUE, FALSE), trafo))
print(fit)
print(fit, full=TRUE)


## Don't show: ## Not run: 
##D #########################################################
##D ## Estimation with fixed sill (variance + nugget       ##
##D ## equals a given constant)                            ##
##D estmodel <- RMgencauchy(var=NA, scale=NA, alpha=NA, beta=NA) +
##D             RMnugget(var=NA) + RMtrend(mean=NA)
##D RFfit(estmodel, data=d, fit.sill=1, fit.optim_var_elimination="try")
##D 
##D 
##D #########################################################
##D ## estimation in a anisotropic framework               ##
##D x <- y <- (1:3)/4
##D model <- RMexp(Aniso=matrix(nc=2, c(4,2,-2,1)), var=1.5)
##D d <- RFsimulate(model, x=x, y=y, n=n)
##D estmodel <- RMexp(Aniso=matrix(nc=2, c(NA,NA,-2,1)), var=NA) +
##D             RMtrend(mean=NA)
##D RFfit(estmodel, data=d, fit.nphi=20)
##D 
##D 
##D #########################################################
##D ## AN EXAMPLE HOW TO USE OF PARAMETER 'transform'      ##
##D ## estimation of coupled parameters (first column of   ##
##D ##           the matrix 'Aniso' has identical entries) ##
##D # source("RandomFields/tests/source.R")
##D RFfit(estmodel, data=d, transform=list()) # shows positions of NAs
##D f <- function(param) param[c(1,2,2)]
##D RFfit(estmodel, data=d, transform=list(c(TRUE, TRUE, FALSE), f))
##D 
##D 
## End(Not run)## End(Don't show)

## Don't show: 
RFoptions(modus_operandi="normal")
## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


