library(sensobol)


### Name: sobol_ci_dummy
### Title: Bootstrap confidence intervals for the dummy parameter
### Aliases: sobol_ci_dummy

### ** Examples

# Define settings:
n <- 100; k <- 8; R <- 10
# Design the sample matrix:
A <- sobol_matrices(n = n, k = k, second = TRUE, third = TRUE)
# Compute the model output:
Y <- sobol_Fun(A)
# Compute the Sobol' indices for the dummy parameter:
s.dummy <- sobol_dummy(Y = Y, params = colnames(data.frame(A)), R = R, n = n)
# Compute the confidence intervals for the dummy parameter:
sobol_ci_dummy(s.dummy, type = "norm", conf = 0.95)



