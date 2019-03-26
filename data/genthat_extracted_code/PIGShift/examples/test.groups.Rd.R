library(PIGShift)


### Name: test.groups
### Title: Test all possible single-rate shift Brownian motion models and
###   an Ornstein-Uhlenbeck model for an arbitrary number of predefined
###   gene groups.
### Aliases: test.groups

### ** Examples

## Not run: 
##D data(yeast)
##D GO.groups.pruned = good.groups(colnames(yeast.homozygote),GO.groups,30)
##D to_test = GO.groups[GO.groups.pruned[1:100]]
##D yeast.test = test.groups(yeast.tree,yeast.homozygote,to_test,print_names=T)
## End(Not run)



