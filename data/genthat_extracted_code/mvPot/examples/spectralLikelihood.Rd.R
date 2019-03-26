library(mvPot)


### Name: spectralLikelihood
### Title: Spectral log-likelihood function
### Aliases: spectralLikelihood

### ** Examples

#Define semi-variogram function
vario <- function(h){
   1 / 2 * norm(h,type = "2")^1.5
}

#Define locations
loc <- expand.grid(1:4, 1:4)

#Simulate data
obs <- simulPareto(1000, loc, vario)

#Evaluate risk functional
sums <- sapply(obs, sum)

#Select exceedances
exceedances <- obs[sums > quantile(sums, 0.9)]

#Evaluate the spectral function
spectralLikelihood(exceedances, loc, vario)



