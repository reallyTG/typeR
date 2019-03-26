library(PIGShift)


### Name: plot_wAICbarplot
### Title: Plot a barplot of AIC weights for each model and each gene group
### Aliases: plot_wAICbarplot

### ** Examples

## Not run: 
##D data(yeast)
##D GO.groups.pruned = good.groups(colnames(yeast.homozygote),GO.groups,30)
##D test_groups = GO.groups[GO.groups.pruned[1:100]]
##D yeast.test = test.groups(yeast.tree,yeast.homozygote,test_groups,print_names=T)
##D plot_wAICbarplot(mytest$wAIC,1:7)
## End(Not run)



