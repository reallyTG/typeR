library(paleotree)


### Name: setRootAge
### Title: Place a Non-Ultrametric Tree of Fossil Taxa on Absolute Time
### Aliases: setRootAge setRootAges

### ** Examples


set.seed(444)
tree <- rtree(10)
tipAges <- cbind(c("t1","t2"), c(15,10))

absTimeTree <- setRootAge(tree = tree,tipAges)

plot(absTimeTree)
axisPhylo()




