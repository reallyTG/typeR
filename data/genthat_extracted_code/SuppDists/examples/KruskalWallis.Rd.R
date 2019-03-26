library(SuppDists)


### Name: KruskalWallis
### Title: Kruskall-Wallis distribution
### Aliases: Kruskal KruskalWallis dKruskalWallis pKruskalWallis
###   qKruskalWallis rKruskalWallis sKruskalWallis
### Keywords: distribution

### ** Examples


# Assuming three treatments, each with a sample size of 5.
pKruskalWallis(1, 3, 15, 0.6)
pKruskalWallis(c(.1,1.5,5.7), 3, 15, 0.6) ## approximately 5% 50% and 95%
sKruskalWallis(3, 15, 0.6)
plot(function(x)dKruskalWallis(x, 3, 15, 0.6),0.5,8)




