library(permute)


### Name: shuffleSet
### Title: Generate a set of permutations from the specified design.
### Aliases: shuffleSet as.matrix.permutationMatrix
### Keywords: htest design

### ** Examples

## simple random permutations, 5 permutations in set
shuffleSet(n = 10, nset = 5)

## series random permutations, 5 permutations in set
shuffleSet(10, 5, how(within = Within(type = "series")))

## series random permutations, 10 permutations in set,
## with possible mirroring
CTRL <- how(within = Within(type = "series", mirror = TRUE))
shuffleSet(10, 10, CTRL)

## Permuting strata
## 4 groups of 5 observations
CTRL <- how(within = Within(type = "none"),
            plots = Plots(strata = gl(4,5), type = "free"))
shuffleSet(20, 10, control = CTRL)

## 10 random permutations in presence of Plot-level strata
plotStrata <- Plots(strata = gl(4,5))
CTRL <- how(plots = plotStrata,
            within = Within(type = "free"))
numPerms(20, control = CTRL)
shuffleSet(20, 10, control = CTRL)
## as above but same random permutation within Plot-level strata
CTRL <- how(plots = plotStrata,
            within = Within(type = "free", constant = TRUE))
numPerms(20, control = CTRL)
shuffleSet(20, 10, CTRL) ## check this.

## time series within each level of Plot strata
CTRL <- how(plots = plotStrata,
            within = Within(type = "series"))
shuffleSet(20, 10, CTRL)
## as above, but  with same permutation for each Plot-level stratum
CTRL <- how(plots = plotStrata,
            within = Within(type = "series", constant = TRUE))
shuffleSet(20, 10, CTRL)



