library(poppr)


### Name: diss.dist
### Title: Calculate a distance matrix based on relative dissimilarity
### Aliases: diss.dist

### ** Examples


# A simple example. Let's analyze the mean distance among populations of A.
# euteiches.

data(Aeut)
mean(diss.dist(popsub(Aeut, 1)))
## Not run: 
##D mean(diss.dist(popsub(Aeut, 2)))
##D mean(diss.dist(Aeut))
## End(Not run)



