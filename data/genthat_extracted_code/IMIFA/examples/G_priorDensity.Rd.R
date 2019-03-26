library(IMIFA)


### Name: G_priorDensity
### Title: Plot Pitman-Yor / Dirichlet Process Priors
### Aliases: G_priorDensity
### Keywords: plotting

### ** Examples

# Plot Dirichlet process priors for different values of alpha
(DP   <- G_priorDensity(N=50, alpha=c(3, 10, 25)))

# Non-zero discount requires loading the "Rmpfr" library
# require("Rmpfr")

# Verify that these alpha/discount values produce Pitman-Yor process priors with the same mean
# G_expected(N=50, alpha=c(19.23356, 6.47006, 1), discount=c(0, 0.47002, 0.7300045))

# Now plot them to examine tail behaviour as discount increases
# (PY <- G_priorDensity(N=50, alpha=c(19.23356, 6.47006, 1), discount=c(0, 0.47002, 0.7300045)))



