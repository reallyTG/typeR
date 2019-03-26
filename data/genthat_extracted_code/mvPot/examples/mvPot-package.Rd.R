library(mvPot)


### Name: mvPot-package
### Title: Multivariate Peaks-over-Threshold Modelling for Extreme Events
###   Analysis
### Aliases: mvPot-package mvPot
### Keywords: mvPot, multivariate, spatial

### ** Examples

#Define semi-variogram function
vario <- function(h, alpha = 1.5){
    norm(h,type = "2")^alpha
}

#Define locations
loc <- expand.grid(1:4, 1:4)

#Simulate data
obs <- simulPareto(1000, loc, vario)

#Evaluate risk functional
sums <- sapply(obs, sum)

#Define weighting function
weigthFun <- function(x, u){
 x * (1 - exp(-(sum(x) / u - 1)))
}

#Define partial derivative of weighting function
dWeigthFun <- function(x, u){
 (1 - exp(-(sum(x) / u - 1))) + (x / u) * exp( - (sum(x) / u - 1))
}


#Select exceedances
threshold <- quantile(sums, 0.9)
exceedances <- obs[sums > threshold]

#Define objective function
objectiveFunction = function(parameter, exceedances, loc, vario, weigthFun, dWeigthFun, threshold){

 #Define semi-variogram for the corresponding parameters
 varioModel <- function(h){
  vario(h, parameter[1])
 }

 #Compute score
 scoreEstimation(exceedances, loc, varioModel, weigthFun, dWeigthFun, u = threshold)
}

#Estimate the parameter by optimization of the objective function
est <- optim(par = c(1.5),
             fn = objectiveFunction,
             exceedances = exceedances,
             loc = loc,
             vario = vario,
             weigthFun = weigthFun,
             dWeigthFun = dWeigthFun,
             threshold = threshold,
             control = list(maxit = 100, trace = 1),
             lower = c(0.01),
             upper = c(1.99),
             method = "L-BFGS-B")



