library(vegan)


### Name: stressplot.wcmdscale
### Title: Display Ordination Distances Against Observed Distances in
###   Eigenvector Ordinations
### Aliases: stressplot.wcmdscale stressplot.cca stressplot.rda
###   stressplot.capscale stressplot.dbrda stressplot.prcomp
###   stressplot.princomp
### Keywords: multivariate

### ** Examples

data(dune, dune.env)
mod <- rda(dune)
stressplot(mod)
mod <- rda(dune ~ Management, dune.env)
stressplot(mod, k=3)



