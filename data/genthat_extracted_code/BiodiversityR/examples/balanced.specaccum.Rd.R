library(BiodiversityR)


### Name: balanced.specaccum
### Title: Balanced Species Accumulation Curves
### Aliases: balanced.specaccum
### Keywords: multivariate

### ** Examples

library(vegan)
data(dune.env)
data(dune)

# not balancing species accumulation
Accum.orig <- specaccum(dune)
Accum.orig

# randomly sample 3 quadrats from each stratum of Management
Accum.1 <- balanced.specaccum(dune, strata=dune.env$Management, reps=3)
Accum.1

# scale results by number of trees per quadrat
dune.env$site.totals <- apply(dune,1,sum)
Accum.2 <- balanced.specaccum(dune, strata=dune.env$Management, reps=3, scale=dune.env$site.totals)
Accum.2



