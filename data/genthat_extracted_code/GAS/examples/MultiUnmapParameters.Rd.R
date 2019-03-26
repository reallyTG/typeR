library(GAS)


### Name: MultiUnmapParameters
### Title: Inverse of MultiMapParameters
### Aliases: UnMapR_C MultiUnmapParameters

### ** Examples

# Unmap parameters for the Multivariate Student-t distribution with N=3
library(GAS)

N = 3

Dist = "mvt"

# Vector of location parameters (this is not transformed).
Mu  = c(0.1, 0.2, 0.3)

# Vector of scales parameters for the firs, second and third variables.
Phi = c(1.0, 1.2, 0.3)

# This represents vec(R), where R is the correlation matrix.
# Note that is up to the user to ensure that vec(R) implies a proper correlation matrix
Rho = c(0.1, 0.2, 0.3)

# Vector of parameters such that the degrees of freedom are 7.
Theta = c(Mu, Phi, Rho, 7)

Theta_tilde = MultiUnmapParameters(Theta, Dist, N)

Theta_tilde

# It works
all(abs(MultiMapParameters(Theta_tilde, Dist, N) - Theta) < 1e-16)



