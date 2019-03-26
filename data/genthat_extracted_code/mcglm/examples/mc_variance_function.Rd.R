library(mcglm)


### Name: mc_variance_function
### Title: Variance Functions
### Aliases: mc_variance_function mc_power mc_binomialP mc_binomialPQ

### ** Examples

x1 <- seq(-1, 1, l = 5)
X <- model.matrix(~x1)
mu <- mc_link_function(beta = c(1, 0.5), X = X, offset = NULL,
                       link = "logit")
mc_variance_function(mu = mu$mu, power = c(2, 1), Ntrial = 1,
                     variance = "binomialPQ", inverse = FALSE,
                     derivative_power = TRUE, derivative_mu = TRUE)




