library(GAS)


### Name: MultiGASSim
### Title: Simulate multivariate GAS processes
### Aliases: MultiGASSim

### ** Examples

# Simulate from a GAS process with Multivariate Student-t conditional
# distribution, time-varying locations, scales, correlations
# and fixed shape parameter.
library("GAS")

set.seed(786)

T.sim = 1000  # Number of observations to simulate.
N     = 3     # Trivariate series.
Dist  = "mvt" # Conditional Multivariate Studen-t distribution.

# Build unconditional vector of reparametrised parameters.

Mu  = c(0.1, 0.2, 0.3) # Vector of location parameters (this is not transformed).
Phi = c(1.0, 1.2, 0.3) # Vector of scale parameters for the firs, second and third variables.

Rho = c(0.1, 0.2, 0.3) # This represents vec(R), where R is the correlation matrix.
                       # Note that is up to the user to ensure that vec(R) implies a
                       # proper correlation matrix.

Theta = c(Mu, Phi, Rho, 7) # Vector of parameters such that the degrees of freedom are 7.

kappa = MultiUnmapParameters(Theta, Dist, N)

A = matrix(0, length(kappa), length(kappa))

# Update scales and correlations, do not update locations and shape parameters.
diag(A) = c(0, 0, 0, 0.05, 0.01, 0.09, 0.01, 0.04, 0.07, 0)

B = matrix(0, length(kappa), length(kappa))

# Update scales and correlations, do not update locations and shape parameters.
diag(B) = c(0, 0, 0, 0.7, 0.7, 0.5, 0.94, 0.97, 0.92, 0)

Sim = MultiGASSim(fit = NULL, T.sim, N, kappa, A, B, Dist, ScalingType = "Identity")

Sim



