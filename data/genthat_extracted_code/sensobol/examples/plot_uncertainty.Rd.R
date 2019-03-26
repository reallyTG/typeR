library(sensobol)


### Name: plot_uncertainty
### Title: Plot model output uncertainty
### Aliases: plot_uncertainty

### ** Examples

# Define settings:
n <- 100; k <- 8; R <- 10
# Design the sample matrix:
A <- sobol_matrices(n = n, k = k, second = FALSE, third = FALSE)
# Compute the model output:
Y <- sobol_Fun(A)
# Plot the model output distribution:
plot_uncertainty(Y)



