library(balance)


### Name: pba
### Title: Principal Balance Analysis
### Aliases: pba pba-class show,pba-method predict,pba-method
###   plot,pba,missing-method plot,pba,matrix-method
###   plot,pba,data.frame-method

### ** Examples

library(balance)
data(iris)
train <- iris[1:50,1:4]
test <- iris[51:150,1:4]
model <- pba(train)
predict(model, test)
plot(model, test)




