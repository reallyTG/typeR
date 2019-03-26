library(nat.nblast)


### Name: plot3d.hclust
### Title: Methods to identify and plot groups of neurons cut from an
###   hclust object
### Aliases: plot3d.hclust

### ** Examples

# 20 Kenyon cells
data(kcs20, package='nat')
# calculate mean, normalised NBLAST scores
x=nblast(kcs20, kcs20, normalised=TRUE)
x=(x+t(x))/2
# note that specifying db explicitly could be avoided by use of the
# \code{nat.default.neuronlist} option.
plot3d(hclust(as.dist(x)), k=3, db=kcs20)



