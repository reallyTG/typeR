library(vegan)


### Name: goodness.metaMDS
### Title: Goodness of Fit and Shepard Plot for Nonmetric Multidimensional
###   Scaling
### Aliases: goodness.metaMDS goodness.monoMDS stressplot
###   stressplot.default stressplot.monoMDS
### Keywords: multivariate

### ** Examples

data(varespec)
mod <- metaMDS(varespec)
stressplot(mod)
gof <- goodness(mod)
gof
plot(mod, display = "sites", type = "n")
points(mod, display = "sites", cex = 2*gof/mean(gof))



