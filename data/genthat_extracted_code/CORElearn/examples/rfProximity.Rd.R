library(CORElearn)


### Name: rfProximity
### Title: A random forest based proximity function
### Aliases: rfProximity
### Keywords: cluster robust

### ** Examples

md <- CoreModel(Species ~ ., iris, model="rf", rfNoTrees=30, maxThreads=1)
pr <- rfProximity(md, outProximity=TRUE)
# visualization
require(lattice)
levelplot(pr)

destroyModels(md) # clean up




