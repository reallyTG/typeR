library(sensobol)


### Name: plot_sobol
### Title: Plot Sobol' first and total-order indices
### Aliases: plot_sobol

### ** Examples

# Define settings:
n <- 500; k <- 8; R <- 100
# Design the sample matrix:
A <- sobol_matrices(n = n, k = k, second = TRUE, third = TRUE)
# Compute the model output:
Y <- sobol_Fun(A)
# Compute the Sobol' indices:
## No test: 
sens <- sobol_indices(Y = Y, params = colnames(data.frame(A)),
R = R, n = n, parallel = "no", ncpus = 1, second = TRUE, third = TRUE)
# Compute the Sobol' indices for the dummy parameter:
s.dummy <- sobol_dummy(Y = Y, params = colnames(data.frame(A)), R = R, n = n)
# Compute confidence intervals:
sens.ci <- sobol_ci(sens, params = colnames(data.frame(A)), type = "norm", conf = 0.95)
# Compute confidence intervals for the dummy parameter:
s.dummy.ci <- sobol_ci_dummy(s.dummy, type = "norm", conf = 0.95)
# Plot Sobol' indices:
plot_sobol(sens.ci, dummy = s.dummy.ci, type = 1)
## End(No test)



