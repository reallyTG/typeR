library(msBP)


### Name: msBP.rsample
### Title: Random numbers from a random msBP densty
### Aliases: msBP.rsample

### ** Examples

rand.tree <- msBP.rtree(50,2, 4)
rand.samp <- msBP.rsample(50, rand.tree)
hist(rand.samp, prob=TRUE)
prob <- msBP.compute.prob(rand.tree)
density <- msBP.pdf(prob, 100)
points(density$dens~density$y, ty='l', col=4)



