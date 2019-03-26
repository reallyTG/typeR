library(spc)


### Name: quadrature.nodes.weights
### Title: Calculate quadrature nodes and weights
### Aliases: quadrature.nodes.weights
### Keywords: ts

### ** Examples

# GL
n <- 10
qnw <-quadrature.nodes.weights(n, type="GL")
qnw

# Radau
n <- 10
qnw <-quadrature.nodes.weights(n, type="Ra")
qnw



