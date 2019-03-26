library(sensitivity)


### Name: sensiFdiv
### Title: Sensitivity Indices based on Csiszar f-divergence
### Aliases: sensiFdiv tell.sensiFdiv print.sensiFdiv plot.sensiFdiv

### ** Examples

## No test: 
library(ks)

# Test case : the non-monotonic Sobol g-function
n <- 100
X <- data.frame(matrix(runif(8 * n), nrow = n))

# Density-based sensitivity analysis
x <- sensiFdiv(model = sobol.fun, X = X, fdiv = c("TV","KL"), nboot=30)
print(x)
## End(No test)



