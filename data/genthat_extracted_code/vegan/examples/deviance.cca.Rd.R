library(vegan)


### Name: deviance.cca
### Title: Statistics Resembling Deviance and AIC for Constrained
###   Ordination
### Aliases: deviance.cca deviance.rda extractAIC.cca
### Keywords: multivariate models

### ** Examples

# The deviance of correspondence analysis equals Chi-square
data(dune)
data(dune.env)
chisq.test(dune)
deviance(cca(dune))
# Stepwise selection (forward from an empty model "dune ~ 1")
ord <- cca(dune ~ ., dune.env)
step(cca(dune ~ 1, dune.env), scope = formula(ord))



