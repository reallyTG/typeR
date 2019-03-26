library(Rssa)


### Name: cadzow
### Title: Cadzow Iterations
### Aliases: cadzow cadzow.ssa

### ** Examples

# Decompose co2 series with default parameters
s <- ssa(co2)
# Now make rank 3 approximation using the Cadzow iterations
F <- cadzow(s, rank = 3, tol = 1e-10)
library(lattice)
xyplot(cbind(Original = co2, Cadzow = F), superpose = TRUE)
# All but the first 3 eigenvalues are close to 0
plot(ssa(F))

# Compare with SSA reconstruction
F <- cadzow(s, rank = 3, maxiter = 1, correct = FALSE)
Fr <- reconstruct(s, groups = list(1:3))$F1
print(max(abs(F - Fr)))

# Cadzow with and without weights
set.seed(3)
N <- 60
L <- 30
K <- N - L + 1
alpha <- 0.1

sigma <- 0.1
signal <- cos(2*pi * seq_len(N) / 10)
x <- signal + rnorm(N, sd = sigma)

weights <- rep(alpha, K)
weights[seq(1, K, L)] <- 1
salpha <- ssa(x, L = L,
              column.oblique = "identity",
              row.oblique = weights)
calpha <- cadzow(salpha, rank = 2)

cz <- cadzow(ssa(x, L = L), rank = 2)

print(mean((cz - signal)^2))
print(mean((calpha - signal)^2))



