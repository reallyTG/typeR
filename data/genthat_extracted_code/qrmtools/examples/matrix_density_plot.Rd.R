library(qrmtools)


### Name: matrix_density_plota
### Title: Density Plot of the Values from a Lower Triangular Matrix
### Aliases: matrix_density_plot
### Keywords: hplot

### ** Examples

## Generate a random correlation matrix
d <- 50
L <- diag(1:d)
set.seed(271)
L[lower.tri(L)] <- runif(choose(d,2))
Sigma <- L 
P <- cor(Sigma)
## Density of its lower triangular entries
matrix_density_plot(P)



