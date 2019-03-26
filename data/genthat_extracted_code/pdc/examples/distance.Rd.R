library(pdc)


### Name: distance
### Title: Codebook Dissimliarities
### Aliases: hellinger.distance squared.hellinger.distance
###   symmetric.alpha.divergence hellingerDistance squaredHellingerDistance
###   symmetricAlphaDivergence

### ** Examples


x <- codebook(c(sin(1:100)),m=3)
y <- codebook(c(sin(1:100*0.1)),m=3)
hellingerDistance(x,y)




