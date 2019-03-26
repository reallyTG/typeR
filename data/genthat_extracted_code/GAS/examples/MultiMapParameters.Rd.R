library(GAS)


### Name: MultiMapParameters
### Title: Mapping function for univariate distributions
### Aliases: MultiMapParameters build_mR MapR_C build_vR

### ** Examples

# Map unrestricted parameters for the Multivariate Student-t distribution with N=3
library("GAS")

N = 3

Dist = "mvt"

# Vector of location parameters (this is not transformed).
Mu_tilde  = c(0.1,0.2,0.3)

# Vector of unrestricted scales parameters such that
# the scales will be equal to 1.0, 1.2 and 0.3, for the first, second and
# third variables, respectively.
Phi_tilde = c(log(1.0), log(1.2), log(0.3))

# The vector c(0.1,0.2,0.3) represents vec(R),
# where R is the correlation matrix.
# Note that is up to the user to ensure that
# vec(R) implies a proper correlation matrix
# The function UnMapR_C transforms vec(R) in a vector of unrestricted parameters. It is
# the inverse of the hyperspherical coordinates transformration.

Rho_tilde = UnMapR_C(c(0.1,0.2,0.3), N)

# Vector of unconditional reparametrised parameters such that the
# degrees of freedom are 7.
#
# LowerNu() prints the lower bound numerical parameter for the degree
# of freedom, see help(LowerNu)
#

Theta_tilde = c(Mu_tilde, Phi_tilde , Rho_tilde, log(7 - LowerNu()))

Theta = MultiMapParameters(Theta_tilde, Dist, N)

Theta



