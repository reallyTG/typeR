library(apricom)


### Name: shrink.heur
### Title: Shrinkage After Estimation Using Heuristic Formulae
### Aliases: shrink.heur

### ** Examples

## Example 1: Linear regression using the iris dataset
## shrinkage using a heuristic formula
data(iris)
iris.data <- as.matrix(iris[, 1:4])
iris.data <- cbind(1, iris.data)
set.seed(123)
shrink.heur(dataset = iris.data, model = "linear")

## Example 2: logistic regression using a subset of the mtcars data
## shrinkage using a heuristic formula
data(mtcars)
mtc.data <- cbind(1,datashape(mtcars, y = 8, x = c(1,6,9)))
head(mtc.data)
set.seed(321)
shrink.heur(dataset = mtc.data, model = "logistic", DF = 3,
int = TRUE, int.adj = TRUE)




