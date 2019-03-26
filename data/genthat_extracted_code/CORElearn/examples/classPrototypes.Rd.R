library(CORElearn)


### Name: classPrototypes
### Title: The typical instances of each class - class prototypes
### Aliases: classPrototypes
### Keywords: robust

### ** Examples

dataset <- iris
md <- CoreModel(Species ~ ., dataset, model="rf", rfNoTrees=30,maxThreads=1)
typical <- classPrototypes(md, dataset, 10)
destroyModels(md) # clean up



