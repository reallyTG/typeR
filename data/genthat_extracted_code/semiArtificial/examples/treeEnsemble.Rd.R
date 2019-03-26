library(semiArtificial)


### Name: treeEnsemble
### Title: A data generator based on forest
### Aliases: treeEnsemble indAttrGen
### Keywords: datagen multivariate classif

### ** Examples

# use iris data set, split into training and testing, inspect the data
set.seed(12345)
train <- sample(1:nrow(iris),size=nrow(iris)*0.5)
irisTrain <- iris[train,]
irisTest <- iris[-train,]

# inspect properties of the original data
plot(iris[,-5], col=iris$Species)
summary(iris)

# create tree ensemble generator for classification problem
irisGenerator<- treeEnsemble(Species~., irisTrain, noTrees=10)

# use the generator to create new data
irisNew <- newdata(irisGenerator, size=200)

#inspect properties of the new data
plot(irisNew[,-5], col = irisNew$Species) # plot generated data
summary(irisNew)

## Not run: 
##D # create tree ensemble generator for unsupervised problem
##D irisUnsupervised<- treeEnsemble(~.,irisTrain[,-5], noTrees=10)
##D irisNewUn <- newdata(irisUnsupervised, size=200)
##D plot(irisNewUn) # plot generated data
##D summary(irisNewUn)
##D 
##D # create tree ensemble generator for regression problem
##D CO2gen<- treeEnsemble(uptake~.,CO2, noTrees=10)
##D CO2New <- newdata(CO2gen, size=200)
##D plot(CO2) # plot original data
##D plot(CO2New) # plot generated data
##D summary(CO2)
##D summary(CO2New)
## End(Not run)




