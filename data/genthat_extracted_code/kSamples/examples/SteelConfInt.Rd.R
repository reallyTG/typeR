library(kSamples)


### Name: SteelConfInt
### Title: Simultaneous Confidence Bounds Based on Steel's Multiple
###   Comparison Wilcoxon Tests
### Aliases: SteelConfInt
### Keywords: nonparametric htest design

### ** Examples

z1 <- c(103, 111, 136, 106, 122, 114)
z2 <- c(119, 100,  97,  89, 112,  86)
z3 <- c( 89, 132,  86, 114, 114, 125)
z4 <- c( 92, 114,  86, 119, 131,  94)
set.seed(2627)
SteelConfInt(list(z1,z2,z3,z4),conf.level=0.95,alternative="two.sided", 
   method="simulated",Nsim=10000)
# or with same seed
# SteelConfInt(z1,z2,z3,z4,conf.level=0.95,alternative="two.sided", 
#   method="simulated",Nsim=10000)



