library(SOMbrero)


### Name: trainSOM
### Title: Run the SOM algorithm
### Aliases: trainSOM summary.somRes print.somRes
### Keywords: methods

### ** Examples

# Run trainSOM algorithm on the iris data with 500 iterations
iris.som <- trainSOM(x.data=iris[,1:4])
iris.som
summary(iris.som)



