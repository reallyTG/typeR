library(yaImpute)


### Name: bestVars
### Title: Computes the number of _best_ X-variables
### Aliases: bestVars
### Keywords: multivariate

### ** Examples

require(yaImpute)

data(iris)
set.seed(12345)

x <- iris[,1:2]  # Sepal.Length Sepal.Width 
y <- iris[,3:4]  # Petal.Length Petal.Width 

vsel <- varSelection(x=x,y=y,nboot=5,useParallel=FALSE)

bestVars(vsel)




