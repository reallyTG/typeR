library(EpiModel)


### Name: check_bip_degdist
### Title: Check Degree Distribution for Bipartite Target Statistics
### Aliases: check_bip_degdist
### Keywords: netUtils

### ** Examples

# An imbalanced distribution
check_bip_degdist(num.m1 = 500, num.m2 = 500,
                  deg.dist.m2 = c(0.40, 0.55, 0.03, 0.02),
                  deg.dist.m1 = c(0.48, 0.41, 0.08, 0.03))

# A balanced distribution
check_bip_degdist(num.m1 = 500, num.m2 = 500,
                  deg.dist.m1 = c(0.40, 0.55, 0.04, 0.01),
                  deg.dist.m2 = c(0.48, 0.41, 0.08, 0.03))




