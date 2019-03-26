library(semiArtificial)


### Name: dataSimilarity
### Title: Evaluate statistical similarity of two data sets
### Aliases: dataSimilarity
### Keywords: datagen multivariate

### ** Examples

# use iris data set, split into training and testing data
set.seed(12345)
train <- sample(1:nrow(iris),size=nrow(iris)*0.5)
irisTrain <- iris[train,]
irisTest <- iris[-train,]

# create RBF generator
irisGenerator<- rbfDataGen(Species~.,irisTrain)

# use the generator to create new data
irisNew <- newdata(irisGenerator, size=100)

# compare statistics of original and new data
dataSimilarity(irisTest, irisNew)




