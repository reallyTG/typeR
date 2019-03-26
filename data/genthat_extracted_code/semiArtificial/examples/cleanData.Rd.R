library(semiArtificial)


### Name: cleanData
### Title: Rejection of new instances based on their distance to existing
###   instances
### Aliases: cleanData
### Keywords: datagen multivariate

### ** Examples

# inspect properties of the iris data set
plot(iris, col=iris$Species)
summary(iris)

irisEnsemble<- treeEnsemble(Species~.,iris,noTrees=10)

# use the generator to create new data with the generator
irisNewEns <- newdata(irisEnsemble, size=150)

#inspect properties of the new data
plot(irisNewEns, col = irisNewEns$Species) #plot generated data
summary(irisNewEns)

clObj <- cleanData(irisEnsemble, irisNewEns, similarDropP=0.05, dissimilarDropP=0.95, 
                   similarDropPclass=0.05, dissimilarDropPclass=0.95, 
		           nearestInstK=1, reassignResponse=FALSE, cleaningObject=NULL) 




