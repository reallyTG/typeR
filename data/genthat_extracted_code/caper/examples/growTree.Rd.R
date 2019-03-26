library(caper)


### Name: growTree
### Title: Tree simulation with traits.
### Aliases: growTree as.comparative.data.growTree
### Keywords: utilities

### ** Examples


## see the package vignette for a much fuller discussion of examples.

# A basic 200 tip tree, output as a 'comparative.data' object
    tree <- growTree(halt=200, grain=Inf)
    plot(tree$phy)

# A basic tree of age 4 time units, output as a 'comparative.data' object
    tree <- growTree(halt=expression(clade.age >= 4), grain=Inf)
    plot(tree$phy)




