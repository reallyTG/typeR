library(RPANDA)


### Name: createModel
### Title: Creation of a PhenotypicModel
### Aliases: createModel

### ** Examples

#Loading an example tree
newick <- "((((A:1,B:0.5):2,(C:3,D:2.5):1):6,E:10.25):2,(F:6.5,G:8.25):3):1;"
tree <- read.tree(text=newick)

#Creating the models
modelBM <- createModel(tree, 'BM')
modelOU <- createModel(tree, 'OU')

#Printing basic or full informations on the model definitions
show(modelBM)
print(modelOU)



