library(distrMod)


### Name: MDEstimator
### Title: Function to compute minimum distance estimates
### Aliases: MDEstimator CvMMDEstimator KolmogorovMDEstimator
###   TotalVarMDEstimator HellingerMDEstimator
### Keywords: univar robust

### ** Examples

## (empirical) Data
x <- rgamma(50, scale = 0.5, shape = 3)

## parametric family of probability measures
G <- GammaFamily(scale = 1, shape = 2)

## Kolmogorov(-Smirnov) minimum distance estimator
MDEstimator(x = x, ParamFamily = G, distance = KolmogorovDist)
## or
KolmogorovMDEstimator(x = x, ParamFamily = G)

## von Mises minimum distance estimator with default mu
MDEstimator(x = x, ParamFamily = G, distance = CvMDist)

## Not run: 
##D ## von Mises minimum distance estimator with default mu
##D MDEstimator(x = x, ParamFamily = G, distance = CvMDist,
##D             asvar.fct = .CvMMDCovariance)
##D ## or
##D CvMMDEstimator(x = x, ParamFamily = G)
##D 
##D ## von Mises minimum distance estimator with mu = N(0,1)
##D MDEstimator(x = x, ParamFamily = G, distance = CvMDist, mu = Norm())
##D 
##D ## Total variation minimum distance estimator
##D ## gamma distributions are discretized
##D MDEstimator(x = x, ParamFamily = G, distance = TotalVarDist)
##D ## or
##D TotalVarMDEstimator(x = x, ParamFamily = G)
##D ## or smoothing of emprical distribution (takes some time!)
##D #MDEstimator(x = x, ParamFamily = G, distance = TotalVarDist, asis.smooth.discretize = "smooth")
##D 
##D ## Hellinger minimum distance estimator
##D ## gamma distributions are discretized
##D distroptions(DistrResolution = 1e-10)
##D MDEstimator(x = x, ParamFamily = G, distance = HellingerDist, startPar = c(1,2))
##D ## or
##D HellingerMDEstimator(x = x, ParamFamily = G, startPar = c(1,2))
##D distroptions(DistrResolution = 1e-6) # default
##D ## or smoothing of emprical distribution (takes some time!)
##D MDEstimator(x = x, ParamFamily = G, distance = HellingerDist, asis.smooth.discretize = "smooth")
## End(Not run)



