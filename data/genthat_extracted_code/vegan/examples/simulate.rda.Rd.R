library(vegan)


### Name: simulate.rda
### Title: Simulate Responses with Gaussian Error or Permuted Residuals for
###   Constrained Ordination
### Aliases: simulate.rda simulate.cca simulate.capscale
### Keywords: models datagen multivariate

### ** Examples

data(dune)
data(dune.env)
mod <- rda(dune ~  Moisture + Management, dune.env)
## One simulation
update(mod, simulate(mod) ~  .)
## An impression of confidence regions of site scores
plot(mod, display="sites")
for (i in 1:5) lines(procrustes(mod, update(mod, simulate(mod) ~ .)), col="blue")
## Simulate a set of null communities with permutation of residuals
simulate(mod, indx = shuffleSet(nrow(dune), 99))



