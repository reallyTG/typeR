library(vegan)


### Name: biplot.rda
### Title: PCA biplot
### Aliases: biplot.rda biplot.cca
### Keywords: hplot

### ** Examples

data(dune)
mod <- rda(dune, scale = TRUE)
biplot(mod, scaling = "symmetric")

## different type for species and site scores
biplot(mod, scaling = "symmetric", type = c("text", "points"))



