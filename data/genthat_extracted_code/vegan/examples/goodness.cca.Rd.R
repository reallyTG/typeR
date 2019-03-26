library(vegan)


### Name: goodness.cca
### Title: Diagnostic Tools for [Constrained] Ordination (CCA, RDA, DCA,
###   CA, PCA)
### Aliases: goodness goodness.cca inertcomp spenvcor intersetcor vif.cca
###   alias.cca
### Keywords: multivariate

### ** Examples

data(dune)
data(dune.env)
mod <- cca(dune ~ A1 + Management + Condition(Moisture), data=dune.env)
goodness(mod, addprevious = TRUE)
goodness(mod, addprevious = TRUE, summ = TRUE)
# Inertia components
inertcomp(mod, prop = TRUE)
inertcomp(mod)
# vif.cca
vif.cca(mod)
# Aliased constraints
mod <- cca(dune ~ ., dune.env)
mod
vif.cca(mod)
alias(mod)
with(dune.env, table(Management, Manure))
# The standard correlations (not recommended)
spenvcor(mod)
intersetcor(mod)



