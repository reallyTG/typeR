library(sensobol)


### Name: sobol_ci
### Title: Bootstrap confidence intervals for Sobol' indices.
### Aliases: sobol_ci

### ** Examples

# Define settings:
n <- 1000; k <- 8; R <- 100
# Design the sample matrix:
A <- sobol_matrices(n = n, k = k, second = TRUE, third = TRUE)
# Compute the model output:
Y <- sobol_Fun(A)
# Compute the Sobol' indices:
## No test: 
sens <- sobol_indices(Y = Y, params = colnames(data.frame(A)),
R = R, n = n, parallel = "no", ncpus = 1,
second = TRUE, third = TRUE)
# Compute confidence intervals:
sobol_ci(sens, params = colnames(data.frame(A)), type = "norm", conf = 0.95)
## End(No test)



