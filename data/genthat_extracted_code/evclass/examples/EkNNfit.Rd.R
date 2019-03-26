library(evclass)


### Name: EkNNfit
### Title: Training of the EkNN classifier
### Aliases: EkNNfit

### ** Examples

## Iris dataset
data(iris)
x<-iris[,1:4]
y<-iris[,5]
fit<-EkNNfit(x,y,K=5)



