library(jrich)


### Name: IndexI
### Title: I index value for a single topology.
### Aliases: IndexI

### ** Examples

 library(jrich)
 data(tree)
 plot(tree)
 indexi               <- IndexI(tree)
 newTree              <- tree
 newTree$tip.label    <- indexi
 plot(newTree)
 





