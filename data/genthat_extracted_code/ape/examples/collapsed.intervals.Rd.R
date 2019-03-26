library(ape)


### Name: collapsed.intervals
### Title: Collapsed Coalescent Intervals
### Aliases: collapsed.intervals
### Keywords: manip

### ** Examples

data("hivtree.table") # example tree
# colescent intervals from vector of interval lengths
ci <- coalescent.intervals(hivtree.table$size)
ci
# collapsed intervals
cl1 <- collapsed.intervals(ci,0)
cl2 <- collapsed.intervals(ci,0.0119)
cl1
cl2



