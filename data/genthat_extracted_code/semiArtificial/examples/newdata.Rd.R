library(semiArtificial)


### Name: newdata
### Title: Generate semi-artificial data using a generator
### Aliases: newdata.RBFgenerator newdata newdata.TreeEnsemble
### Keywords: datagen multivariate

### ** Examples

# inspect properties of the iris data set
plot(iris, col=iris$Species)
summary(iris)

# create RBF generator
irisRBF<- rbfDataGen(Species~.,iris)
# create treesemble  generator
irisEnsemble<- treeEnsemble(Species~.,iris,noTrees=10)


# use the generator to create new data with both generators
irisNewRBF <- newdata(irisRBF, size=150)
irisNewEns <- newdata(irisEnsemble, size=150)

#inspect properties of the new data
plot(irisNewRBF, col = irisNewRBF$Species) #plot generated data
summary(irisNewRBF)
plot(irisNewEns, col = irisNewEns$Species) #plot generated data
summary(irisNewEns)



