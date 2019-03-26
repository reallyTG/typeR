library(vegan)


### Name: tolerance
### Title: Species tolerances and sample heterogeneities
### Aliases: tolerance tolerance.cca

### ** Examples

data(dune)
data(dune.env)
mod <- cca(dune ~ ., data = dune.env)

## defaults to species tolerances
tolerance(mod)

## sample heterogeneities for CCA axes 1:6
tolerance(mod, which = "sites", choices = 1:6)



