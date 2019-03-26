library(evclass)


### Name: EkNNinit
### Title: Initialization of parameters for the EkNN classifier
### Aliases: EkNNinit

### ** Examples

## Iris dataset
data(iris)
x<-iris[,1:4]
y<-iris[,5]
param<-EkNNinit(x,y)
param



