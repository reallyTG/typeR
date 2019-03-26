library(vegan)


### Name: anosim
### Title: Analysis of Similarities
### Aliases: anosim summary.anosim plot.anosim
### Keywords: multivariate nonparametric htest

### ** Examples

data(dune)
data(dune.env)
dune.dist <- vegdist(dune)
dune.ano <- with(dune.env, anosim(dune.dist, Management))
summary(dune.ano)
plot(dune.ano)



