library(vegan)


### Name: ordiresids
### Title: Plots of Residuals and Fitted Values for Constrained Ordination
### Aliases: ordiresids
### Keywords: hplot

### ** Examples

data(varespec)
data(varechem)
mod <- cca(varespec ~ Al + P + K, varechem)
ordiresids(mod)
ordiresids(mod, formula = Residuals ~ Fitted | Species, residuals="standard",
   cex = 0.5)



