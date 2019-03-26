library(distrMod)


### Name: MCEstimator
### Title: Function to compute minimum criterion estimates
### Aliases: MCEstimator
### Keywords: univar

### ** Examples

## (empirical) Data
x <- rgamma(50, scale = 0.5, shape = 3)

## parametric family of probability measures
G <- GammaFamily(scale = 1, shape = 2)

## Maximum Likelihood estimator
## Note: you can directly use function MLEstimator!
negLoglikelihood <- function(x, Distribution){
    res <- -sum(log(Distribution@d(x)))
    names(res) <- "Negative Log-Likelihood"
    return(res)
}
MCEstimator(x = x, ParamFamily = G, criterion = negLoglikelihood)

## Kolmogorov(-Smirnov) minimum distance estimator
## Note: you can also use function MDEstimator!
MCEstimator(x = x, ParamFamily = G, criterion = KolmogorovDist, 
            crit.name = "Kolmogorov distance")

## Total variation minimum distance estimator
## Note: you can also use function MDEstimator!
## discretize Gamma distribution
MCEstimator(x = x, ParamFamily = G, criterion = TotalVarDist, 
            crit.name = "Total variation distance")

## or smooth empirical distribution (takes some time!)
#MCEstimator(x = x, ParamFamily = G, criterion = TotalVarDist, 
#            asis.smooth.discretize = "smooth", crit.name = "Total variation distance")

## Hellinger minimum distance estimator
## Note: you can also use function MDEstimator!
## discretize Gamma distribution
distroptions(DistrResolution = 1e-8)
MCEstimator(x = x, ParamFamily = G, criterion = HellingerDist, 
            crit.name = "Hellinger Distance", startPar = c(1,2))
distroptions(DistrResolution = 1e-6)

## or smooth empirical distribution (takes some time!)
#MCEstimator(x = x, ParamFamily = G, criterion = HellingerDist, 
#            asis.smooth.discretize = "smooth", crit.name = "Hellinger distance")



