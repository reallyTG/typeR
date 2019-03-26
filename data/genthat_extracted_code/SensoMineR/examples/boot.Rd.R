library(SensoMineR)


### Name: boot
### Title: Simulate virtual panels for several functions
### Aliases: boot
### Keywords: multivariate dplot

### ** Examples

## Not run: 
##D ######## Napping example
##D data(napping)
##D res <- boot(napping.don,method="napping")
##D 
##D ######## Sorting task example
##D data(perfume)
##D res <- boot(perfume,method="sorting")
##D 
##D ######## Sorted task napping example
##D data(smoothies)
##D res <- boot(smoothies,method="sortnapping")
##D 
##D ######## Hierarchical sorting task example
##D data(cards)
##D group.cards<-c(2,3,3,2,2,4,2,3,2,1,3,2,3,3,3,2,3,3,2,3,3,3,3,3,3,3,3,3,3,3)
##D res <- boot(cards,method="hsort", group=group.cards)
##D 
##D ######## Free choice profiling example
##D data(perfume_fcp)
##D res <- boot(perfume_fcp, method="freechoice", group = c(12,7,7,7,6,8))
## End(Not run)



