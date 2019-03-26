library(PerMallows)


### Name: rdist
### Title: Generate a collection of permutations at a given distance
### Aliases: rdist

### ** Examples

rdist(1, 4, 2 ) 
rdist(1, 4, 2, "ulam")
len <-  3
rdist(n = 1, perm.length = len, dist.value = len, "h") #derangement
cycles <- 2
rdist(n = 1, perm.length = len, dist.value = len - cycles, "c") #permutation with 2 cycles



