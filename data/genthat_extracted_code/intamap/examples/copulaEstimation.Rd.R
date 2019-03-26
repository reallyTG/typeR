library(intamap)


### Name: copulaEstimation
### Title: ML-estimation of the spatial copula model parameters
### Aliases: copulaEstimation
### Keywords: spatial

### ** Examples

data(intamapExampleObject)
## estimate parameters for the copula model

## Not run: 
##D copula<-list(method="norm")
##D anisotropy <- list(lower = c(0, 1), upper = c(pi, Inf), params = c(pi/3, 2))
##D correlation <- list(model = "Ste", lower = c(0.01, 0.01, 0.01), upper = c(0.99, Inf, 20), 
##D                     params = c(0.05, 4, 3))
##D margin <- list(name = "gev", lower = c(0.01, -Inf), upper = c(Inf, Inf), params = c(30, 0.5))
##D trend <- list(F = as.matrix(rep(1, 196)), lower = -Inf, upper = Inf, params = 40)
##D estimates <- copulaEstimation(intamapExampleObject, margin, trend, correlation, anisotropy, copula)
##D ## make predictions at unobserved locations
##D predictions <- bayescopula(intamapExampleObject, estimates, search = 25,
##D                calc = list(mean = TRUE, variance = TRUE, excprob = 40, quantile = 0.95))
## End(Not run)



