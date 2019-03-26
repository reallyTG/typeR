library(MGLM)


### Name: rgdirmn
### Title: The Generalized Dirichlet Multinomial Distribution
### Aliases: rgdirmn gdirmn dgdirmn
### Keywords: distribution models

### ** Examples

# example 1
m <- 20
alpha <- c(0.2, 0.5)
beta <- c(0.7, 0.4)
Y <- rgdirmn(10, m, alpha, beta)
dgdirmn(Y, alpha, beta)

# example 2 
set.seed(100)
alpha <- matrix(abs(rnorm(40)), 10, 4)
beta <- matrix(abs(rnorm(40)), 10, 4)
size <- rbinom(10, 10, 0.5)
GDM.rdm <- rgdirmn(size=size, alpha=alpha, beta=beta)
GDM.rdm1 <- rgdirmn(n=20, size=10, alpha=abs(rnorm(4)), beta=abs(rnorm(4)))



