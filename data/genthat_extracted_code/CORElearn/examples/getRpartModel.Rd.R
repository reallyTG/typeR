library(CORElearn)


### Name: getRpartModel
### Title: Conversion of a CoreModel tree into a rpart.object
### Aliases: getRpartModel
### Keywords: tree

### ** Examples

# plot a decision tree directly
dataset <- CO2
md<-CoreModel(Plant ~ ., dataset, model="tree")
plot(md, dataset)

# or indirectly 
rpm <- getRpartModel(md, dataset)
# set angle to tan(0.5)=45 (degrees) and length of branches at least 5 
plot(rpm, branch=0.5, minbranch=5, compress=TRUE)
# pretty=0 prints full names of attributes, 
# numbers to 3 decimals, try to make a dendrogram more compact
text(rpm, pretty=0, digits=3)
destroyModels(md) # clean up

# an alternative is to use fancier rpart.plot package
# rpart.plot(rpm) # rpart.plot has many parameters controlling the output
# but it cannot plot models in tree leaves 



