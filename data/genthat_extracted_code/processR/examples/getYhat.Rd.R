library(processR)


### Name: getYhat
### Title: Get predicted value from object of class "lm"
### Aliases: getYhat

### ** Examples

iris1=addCatVars(iris,c("Species"))
iris3=addCatVars(iris,c("Species"),mode=3)
fit1=lm(Sepal.Length~Sepal.Width+D1+D2,data=iris1)
getYhat(fit1)
fit1=lm(Sepal.Length~D2*Sepal.Width+Sepal.Width*D1+Petal.Width,data=iris1)
getYhat(fit1)
fit3=lm(Sepal.Length~D2*Sepal.Width+Sepal.Width*D1+Petal.Width*D1+Petal.Width*D2,data=iris3)
getYhat(fit3,mode=3)



