library(extraDistr)


### Name: Dirichlet
### Title: Dirichlet distribution
### Aliases: Dirichlet ddirichlet rdirichlet
### Keywords: distribution

### ** Examples


# Generating 10 random draws from Dirichlet distribution
# parametrized using a vector

rdirichlet(10, c(1, 1, 1, 1))

# or parametrized using a matrix where each row
# is a vector of parameters

alpha <- matrix(c(1, 1, 1, 1:3, 7:9), ncol = 3, byrow = TRUE)
rdirichlet(10, alpha)




