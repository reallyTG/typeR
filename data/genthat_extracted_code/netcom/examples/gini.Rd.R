library(netcom)


### Name: gini
### Title: Gini coefficient
### Aliases: gini

### ** Examples

# Vectors are not supported. First convert to a single-column matrix.
sample_data <- runif(20, 0, 1)
gini(matrix(sample_data, ncol = 1))

# Multiple Gini coefficients can be calculated simultaneously
gini(matrix(sample_data, ncol = 2)) 




