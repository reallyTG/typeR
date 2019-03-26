library(PIGShift)


### Name: plot_logfoldchange
### Title: Plot densities of expression differences, possibly normalized
### Aliases: plot_logfoldchange

### ** Examples

data(yeast)
sqrt.dist = compute.sqrt.dist(yeast.tree)
par(mfrow=c(1,2))
test_group = "GO:0007346|regulation of mitotic cell cycle"
plot_logfoldchange(yeast.homozygote,GO.groups,test_group)
plot_logfoldchange(yeast.homozygote,GO.groups,test_group,normalize=sqrt.dist)



