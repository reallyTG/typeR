library(BKPC)


### Name: gaussKern
### Title: Gaussian kernel
### Aliases: gaussKern

### ** Examples


data(iris)

testset <- sample(1:150,20)
train <- as.matrix(iris[-testset ,-5])
test <- as.matrix(iris[testset ,-5])


# make training set kernel
gk <- gaussKern(train)
Ktrain <- gk$K

image(Ktrain)

# make testing set kernel
gk2 <- gaussKern(train, test, gk$theta) 
Kest <- gk2$K




