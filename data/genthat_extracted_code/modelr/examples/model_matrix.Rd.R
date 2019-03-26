library(modelr)


### Name: model_matrix
### Title: Construct a design matrix
### Aliases: model_matrix

### ** Examples

model_matrix(mtcars, mpg ~ cyl)
model_matrix(iris, Sepal.Length ~ Species)
model_matrix(iris, Sepal.Length ~ Species - 1)



