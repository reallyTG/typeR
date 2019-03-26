library(mvPot)


### Name: censoredLikelihoodXS
### Title: Censored log-likelihood function of the extremal Student model
### Aliases: censoredLikelihoodXS

### ** Examples

#Define correlation function
corrFun <- function(h, alpha = 1, lambda = 1){
   exp(-norm(h, type = "2")^alpha/lambda)
}

#Define locations
loc <- expand.grid(1:4, 1:4)

#Compute generating vector
p <- 499L
latticeRule <- genVecQMC(p, (nrow(loc) - 1))
primeP <- latticeRule$primeP
vec <- latticeRule$genVec

#Simulate data
Sigma <- exp(-as.matrix(dist(loc))^0.8)
obs <- rExtremalStudentParetoProcess(n = 1000, nu = 2, Sigma = Sigma)
obs <- split(obs, row(obs))

#Evaluate risk functional
maxima <- sapply(obs, max)
thres <- quantile(maxima, 0.9)

#Select exceedances
exceedances <- obs[maxima > thres]

#Compute log-likelihood function
eval <- censoredLikelihoodXS(exceedances, loc, corrFun, nu = 2, rep(thres, nrow(loc)), primeP, vec)




