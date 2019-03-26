library(RPANDA)


### Name: getTipDistribution
### Title: Distribution of tip trait values.
### Aliases: getTipDistribution

### ** Examples

#Loading an example tree
newick <- "((((A:1,B:0.5):2,(C:3,D:2.5):1):6,E:10.25):2,(F:6.5,G:8.25):3):1;"
tree <- read.tree(text=newick)

#Creating a BM model
modelBM <- createModel(tree, 'BM')

#Tip trait distribution under the model :
getTipDistribution(modelBM, c(0,0,0,1))



