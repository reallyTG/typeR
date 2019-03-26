library(klaR)


### Name: stepclass
### Title: Stepwise variable selection for classification
### Aliases: stepclass stepclass.default stepclass.formula print.stepclass
###   plot.stepclass
### Keywords: multivariate

### ** Examples

data(iris)
library(MASS)
iris.d <- iris[,1:4]  # the data    
iris.c <- iris[,5]    # the classes 
sc_obj <- stepclass(iris.d, iris.c, "lda", start.vars = "Sepal.Width")
sc_obj
plot(sc_obj)

## or using formulas:
sc_obj <- stepclass(Species ~ ., data = iris, method = "qda", 
    start.vars = "Sepal.Width", criterion = "AS")  # same as above 
sc_obj
## now you can say stuff like
## qda(sc_obj$formula, data = B3)



