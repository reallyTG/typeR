library(vegan)


### Name: metaMDS
### Title: Nonmetric Multidimensional Scaling with Stable Solution from
###   Random Starts, Axis Scaling and Species Scores
### Aliases: metaMDS metaMDSdist metaMDSiter metaMDSredist initMDS postMDS
###   plot.metaMDS points.metaMDS text.metaMDS scores.metaMDS
### Keywords: multivariate

### ** Examples

## The recommended way of running NMDS (Minchin 1987)
##
data(dune)
# Global NMDS using monoMDS
sol <- metaMDS(dune)
sol
plot(sol, type="t")
## Start from previous best solution
sol <- metaMDS(dune, previous.best = sol)
## Local NMDS and stress 2 of monoMDS
sol2 <- metaMDS(dune, model = "local", stress=2)
sol2
## Use Arrhenius exponent 'z' as a binary dissimilarity measure
sol <- metaMDS(dune, distfun = betadiver, distance = "z")
sol



