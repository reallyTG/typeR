library(tailDepFun)


### Name: EstimationMaxLinear
### Title: Estimation of the parameters of the max-linear model
### Aliases: EstimationMaxLinear

### ** Examples

## Generate data
set.seed(1)
n <- 1000
fr <- matrix(-1/log(runif(2*n)), nrow = n, ncol = 2)
data <- cbind(pmax(0.3*fr[,1],0.7*fr[,2]),pmax(0.5*fr[,1],0.5*fr[,2]),pmax(0.9*fr[,1],0.1*fr[,2]))
## Transform data to unit Pareto margins
x <- apply(data, 2, function(i) n/(n + 0.5 - rank(i)))
## Define indices in which we evaluate the estimator
indices <- selectGrid(cst = c(0,0.5,1), d = 3)
EstimationMaxLinear(x, indices, k = 100, method = "WLS", startingValue = c(0.3,0.5,0.9))
indices <- selectGrid(cst = c(0,1), d = 3)
EstimationMaxLinear(x, indices, k = 100, method = "Mestimator", startingValue = c(0.3,0.5,0.9))



