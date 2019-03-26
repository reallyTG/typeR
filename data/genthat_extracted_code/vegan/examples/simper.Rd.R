library(vegan)


### Name: simper
### Title: Similarity Percentages
### Aliases: simper summary.simper
### Keywords: multivariate

### ** Examples

data(dune)
data(dune.env)
(sim <- with(dune.env, simper(dune, Management)))
summary(sim)



