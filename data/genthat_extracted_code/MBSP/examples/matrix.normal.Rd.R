library(MBSP)


### Name: matrix.normal
### Title: Matrix-Normal Distribution
### Aliases: matrix.normal

### ** Examples


# Draw a random 50x20 matrix from MN(O,U,V),
# where:
#    O = zero matrix of dimension 50x20
#    U has AR(1) structure,
#    V has sigma^2*I structure

# Specify Mean.mat
p <- 50
q <- 20
Mean.mat <- matrix(0, nrow=p, ncol=q)

# Construct U
rho <- 0.5
times <- 1:p
H <- abs(outer(times, times, "-"))
U <- rho^H

# Construct V
sigma.sq <- 2
V <- sigma.sq*diag(q)

# Draw from MN(Mean.mat, U, V)
mn.draw <- matrix.normal(Mean.mat, U, V)



