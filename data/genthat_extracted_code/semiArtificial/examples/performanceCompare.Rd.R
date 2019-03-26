library(semiArtificial)


### Name: performanceCompare
### Title: Evaluate similarity of two data sets based on predictive
###   performance
### Aliases: performanceCompare
### Keywords: datagen multivariate

### ** Examples

# use iris data set

# create RBF generator
irisGenerator<- rbfDataGen(Species~.,iris)

# use the generator to create new data
irisNew <- newdata(irisGenerator, size=200)

# compare statistics of original and new data
performanceCompare(iris, irisNew, Species~.)




