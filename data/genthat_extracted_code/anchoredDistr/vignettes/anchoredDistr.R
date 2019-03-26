## ---- eval=FALSE---------------------------------------------------------
#  install.packages(anchoredDistr)

## ------------------------------------------------------------------------
library(anchoredDistr)

## ------------------------------------------------------------------------
load(system.file("extdata", "pumpingInput.RData", package = "anchoredDistr"))
head(obs)
head(realizations)
head(priors)
proj <- new("MADproject",
             numLocations = 1,
             numTimesteps = 100,
             numSamples   = 50,
             numAnchors = 0,
             numTheta = 1,
             observations = obs,
             realizations = realizations,
             priors = priors)

## ------------------------------------------------------------------------
data(pumping)

## ------------------------------------------------------------------------
print(pumping)

## ---- fig.width=7.2, fig.height=4----------------------------------------
plotMAD(pumping, "realizations")

## ---- results='hide'-----------------------------------------------------
pumping <- calcLikelihood(pumping, 100)
pumping <- calcPosterior(pumping)

## ---- fig.width=7.2, fig.height=4----------------------------------------
plotMAD(pumping, "posteriors")

## ---- results='hide'-----------------------------------------------------
pumping.min <- reduceData(pumping, min)
pumping.min <- calcLikelihood(pumping.min)
pumping.min <- calcPosterior(pumping.min)

## ---- fig.width=7.2, fig.height=4----------------------------------------
plotMAD(pumping.min, "posteriors")

## ---- results='hide'-----------------------------------------------------
matern <- function(x, params){
  sigma <- params[1]
  lambda <- params[2]
  kappa <- params[3]  
  t <- sqrt(2*kappa)*x/lambda
  cov <-  ((sigma*(t^kappa)/gamma(kappa))*2^(1-kappa))*besselK(t,kappa)
  return(sigma-cov)
}

## ---- results='hide'-----------------------------------------------------
init.matern <- function(x){
  params<- c()
  params[1] <- min(x)
  params[2] <- min(10, tail(which(x > 0.3*min(x)),1)) 
  params[3] <- 0.5
  return(params)
}

## ---- results='hide'-----------------------------------------------------
pumping.matern <- reduceData(pumping, matern, init.matern, lower=c(-Inf,1,0.1), upper=c(0,100,5), algorithm="port")

## ---- fig.width=7.2, fig.height=8----------------------------------------
plotMAD(pumping.matern, "realizations")

## ---- results='hide'-----------------------------------------------------
pumping.matern <- calcLikelihood(pumping.matern)
pumping.matern <- calcPosterior(pumping.matern)

## ---- fig.width=7.2, fig.height=4----------------------------------------
plotMAD(pumping.matern, "posteriors")

## ---- fig.width=7.2, fig.height=4, message=FALSE, results='hide'---------
testConvergence(pumping.matern)

