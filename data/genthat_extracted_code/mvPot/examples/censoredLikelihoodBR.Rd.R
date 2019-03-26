library(mvPot)


### Name: censoredLikelihoodBR
### Title: Censored log-likelihood function for the Brown-Resnick model.
### Aliases: censoredLikelihoodBR censoredLikelihood

### ** Examples

#Define semi-variogram function
vario <- function(h){
   0.5 * norm(h, type = "2")^1.5
}

#Define locations
loc <- expand.grid(1:4, 1:4)

#Simulate data
obs <- simulPareto(1000, loc, vario)

#Evaluate risk functional
maxima <- sapply(obs, max)
thres <- quantile(maxima, 0.9)

#Select exceedances
exceedances <- obs[maxima > thres]

#Compute generating vector
p <- 499
latticeRule <- genVecQMC(p, (nrow(loc) - 1))
primeP <- latticeRule$primeP
vec <- latticeRule$genVec


#Compute log-likelihood function
censoredLikelihoodBR(exceedances, loc, vario, rep(thres, nrow(loc)), primeP, vec)



