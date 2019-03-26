library(sensobol)


### Name: plot_scatter
### Title: Scatterplots of the model output against the model inputs
### Aliases: plot_scatter

### ** Examples

# Define settings:
n <- 100; k <- 8; R <- 10
# Design the sample matrix:
A <- sobol_matrices(n = n, k = k, second = TRUE, third = TRUE)
# Compute the model output:
Y <- sobol_Fun(A)
# Plot scatterplots:
plot_scatter(x = A, Y = Y, n = n, params = colnames(data.frame(A)))



