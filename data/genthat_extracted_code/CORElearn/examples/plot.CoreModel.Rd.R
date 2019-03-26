library(CORElearn)


### Name: plot.CoreModel
### Title: Visualization of CoreModel models
### Aliases: plot.CoreModel
### Keywords: cluster robust tree

### ** Examples

# decision tree
dataset <- CO2
md <- CoreModel(Plant ~ ., dataset, model="tree")
plot(md, dataset)

# more versatile graph can be obtained by explicit conversion to rpart.object 
rpm <- getRpartModel(md,dataset)
# and than setting additional graphical parameters in plot.rpart and text.rpart
# E.g., set angle to tan(0.5)=45 (degrees) and length of branches at least 5, 
# try to make a dendrogram more compact
plot(rpm, branch=0.5, minbranch=5, compress=TRUE)
#(pretty=0) full names of attributes, numbers to 3 decimals, 
text(rpm, pretty=0, digits=3)

# an alternative is to use fancier rpart.plot package
# rpart.plot(rpm) # rpart.plot has many parameters controlling the output
# but it cannot plot models in leaves 

destroyModels(md) # clean up

# regression tree
dataset <- CO2
mdr <- CoreModel(uptake ~ ., dataset, model="regTree")
plot(mdr, dataset)
destroyModels(mdr) # clean up

#random forests
dataset <- iris
mdRF <- CoreModel(Species ~ ., dataset, model="rf", rfNoTrees=30, maxThreads=1)
plot(mdRF, dataset, rfGraphType="attrEval")
plot(mdRF, dataset, rfGraphType="outliers")
plot(mdRF, dataset, rfGraphType="scaling")
plot(mdRF, dataset, rfGraphType="prototypes")
plot(mdRF, dataset, rfGraphType="attrEvalCluster", clustering=NULL)
destroyModels(mdRF) # clean up




