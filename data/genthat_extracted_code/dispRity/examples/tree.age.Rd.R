library(dispRity)


### Name: tree.age
### Title: Calculating the age of nodes and tips in a tree.
### Aliases: tree.age

### ** Examples

## A dated random phylogeny with a root 50 units of time old.
tree.age(rtree(10), age = 50)
## A random tree with the distance since the root.
tree.age(rtree(10), order = 'present')




