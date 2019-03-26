library(vegan)


### Name: anova.cca
### Title: Permutation Test for Constrained Correspondence Analysis,
###   Redundancy Analysis and Constrained Analysis of Principal Coordinates
### Aliases: anova.cca permutest permutest.cca
### Keywords: multivariate htest

### ** Examples

data(varespec, varechem)
mod <- cca(varespec ~ Al + P + K, varechem)
## overall test
anova(mod)
## tests for individual terms
anova(mod, by="term")
anova(mod, by="margin")
## test for adding all environmental variables
anova(mod, cca(varespec ~ ., varechem))



