library(semiArtificial)


### Name: dsClustCompare
### Title: Evaluate clustering similarity of two data sets
### Aliases: dsClustCompare
### Keywords: datagen multivariate

### ** Examples

# use iris data set

# create RBF generator
irisGenerator<- rbfDataGen(Species~.,iris)

# use the generator to create new data
irisNew <- newdata(irisGenerator, size=200)

# compare ARI computed on clustering with original and new data
dsClustCompare(iris, irisNew)




