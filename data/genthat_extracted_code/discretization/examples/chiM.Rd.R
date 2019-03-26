library(discretization)


### Name: chiM
### Title: Discretization using ChiMerge algorithm
### Aliases: chiM

### ** Examples

#--Discretization using the ChiMerge method
data(iris)
disc=chiM(iris,alpha=0.05)

#--cut-points
disc$cutp
#--discretized data matrix
disc$Disc.data



