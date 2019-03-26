library(fuzzySim)


### Name: simFromSetOps
### Title: Calculate similarity from set operations
### Aliases: simFromSetOps

### ** Examples

# take two species which occur in 22 and 35 area units, respectively
# and which overlap in 8 of those units:

sp1 <- 22
sp2 <- 35
int <- 8
uni <- sp1 + sp2 - int


# calculate similarity between their distributions based on 
# different indices:

simFromSetOps(intersection = int, union = uni, method = "Jaccard")

simFromSetOps(sp1, sp2, int, uni, method = "Sorensen")

simFromSetOps(sp1, sp2, int, uni, method = "Simpson")


# if you want Baroni-Urbani & Buser's index
# you need to provide also the total size of your study area:

simFromSetOps(sp1, sp2, int, uni, total = 100, method = "Baroni")



