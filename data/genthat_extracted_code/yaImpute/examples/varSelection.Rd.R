library(yaImpute)


### Name: varSelection
### Title: Select variables for imputation models
### Aliases: varSelection
### Keywords: multivariate

### ** Examples

data(iris)

set.seed(12345)

x <- iris[,1:2]  # Sepal.Length Sepal.Width 
y <- iris[,3:4]  # Petal.Length Petal.Width 

vsel <- varSelection(x=x,y=y,nboot=5,useParallel=FALSE)
vsel

bestVars(vsel)

plot(vsel)




