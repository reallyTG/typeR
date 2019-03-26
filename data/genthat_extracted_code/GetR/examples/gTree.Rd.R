library(GetR)


### Name: gTree
### Title: Calculate Guttman error trees using recursive partitioning
### Aliases: gTree

### ** Examples

data(Communality)
Communality$ge <- guttmanErrors(Communality[,1:10])
Communality.tree <- gTree(ge ~ sex + age, data = Communality)
plot(Communality.tree)



