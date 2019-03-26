library(mvPot)


### Name: scoreEstimation
### Title: Gradient score function for the Brown-Resnick model.
### Aliases: scoreEstimation

### ** Examples

#Define variogram function
vario <- function(h){
   1 / 2 * norm(h,type = "2")^1.5
}

#Define locations
loc <- expand.grid(1:4, 1:4)

#Simulate data
obs <- simulPareto(1000, loc, vario)

#Evaluate risk functional
sums <- sapply(obs, sum)

#Define weighting function
weightFun <- function(x, u){
 x * (1 - exp(-(sum(x / u) - 1)))
}

#Define partial derivative of weighting function
dWeightFun <- function(x, u){
(1 - exp(-(sum(x / u) - 1))) + (x / u) * exp( - (sum(x / u) - 1))
}

#Select exceedances
threshold <- quantile(sums, 0.9)
exceedances <- obs[sums > threshold]

#Evaluate gradient score function
scoreEstimation(exceedances, loc, vario, weightFun = weightFun, dWeightFun, u = threshold)



