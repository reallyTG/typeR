library(tailDepFun)


### Name: EstimationGumbel
### Title: Estimation of the parameter of the Gumbel model
### Aliases: EstimationGumbel

### ** Examples

## Generate data with theta = 0.5
## set.seed(1)
## n <- 1000
## cop <- copula::gumbelCopula(param = 2, dim = 3)
## data <- copula::rCopula(n = n,copula = cop)
## Transform data to unit Pareto margins
## x <- apply(data, 2, function(i) n/(n + 0.5 - rank(i)))
## Define indices in which we evaluate the estimator
## indices <- selectGrid(c(0,1), d = 3)
## EstimationGumbel(x, indices, k = 50, method = "WLS", biascorr = TRUE)



