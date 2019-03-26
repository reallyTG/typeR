library(gllvm)


### Name: ordiplot.gllvm
### Title: Plot latent variables from gllvm model
### Aliases: ordiplot.gllvm ordiplot

### ** Examples

#'## Load a dataset from the mvabund package
data(antTraits)
y <- as.matrix(antTraits$abund)
fit <- gllvm(y, family = poisson())
# Ordination plot:
ordiplot(fit)
# Biplot with 10 species
ordiplot(fit, biplot = TRUE, ind.spp = 10)




