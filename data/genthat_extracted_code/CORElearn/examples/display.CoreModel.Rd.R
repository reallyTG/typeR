library(CORElearn)


### Name: display.CoreModel
### Title: Displaying decision and regression trees
### Aliases: display.CoreModel display
### Keywords: tree

### ** Examples

# decision tree
dataset <- CO2
md <- CoreModel(Plant ~ ., dataset, model="tree")
display(md)
destroyModels(md) #clean up

# regression tree
dataset <- CO2
mdr <- CoreModel(uptake ~ ., dataset, model="regTree")
display(mdr, format="dot")
destroyModels(mdr) # clean up




