library(DecorateR)


### Name: predict.DECORATE
### Title: Predict method for DECORATE objects
### Aliases: predict.DECORATE

### ** Examples


data(iris)
y <- as.factor(ifelse(iris$Species[1:100]=="setosa",0,1))
x <- iris[1:100,-5]
dec <- DECORATE(x = x, y = y)
predict(object=dec,newdata=x)





