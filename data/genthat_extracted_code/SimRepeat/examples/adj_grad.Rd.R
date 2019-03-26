library(SimRepeat)


### Name: adj_grad
### Title: Convert Non-Positive-Definite Correlation Matrix to
###   Positive-Definite Matrix Using the Adjusted Gradient Updating Method
### Aliases: adj_grad

### ** Examples

Sigma <- matrix(c(1, 0, 0.8, 0, 1, 0.8, 0.8, 0.8, 1), 3, 3, byrow = TRUE)
adj_grad(Sigma)




