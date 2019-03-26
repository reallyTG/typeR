library(DirichletReg)


### Name: Dirichlet
### Title: The Dirichlet Distribution
### Aliases: rdirichlet ddirichlet ddirichlet_R

### ** Examples

X1 <- rdirichlet(100, c(5, 5, 10))

a.mat <- cbind(1:10, 5, 10:1)
a.mat
X2 <- rdirichlet(10, a.mat)
# note how the probabilities in the first an last column relate to a.mat
round(X2, 2)

ddirichlet(X1, c(5, 5, 10))
ddirichlet(X2, a.mat)



