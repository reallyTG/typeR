library(apricom)


### Name: loocval
### Title: Leave-one-out Cross-validation-derived Shrinkage
### Aliases: loocval

### ** Examples

## Example 1: Linear regression using the iris dataset
## Leave-one-out cross-validation-derived shrinkage
data(iris)
iris.data <- as.matrix(iris[, 1:4])
iris.data <- cbind(1, iris.data)
sdm1 <- matrix(c(0, 1, 1, 1), nrow = 1)
set.seed(123)
loocval(dataset = iris.data, model = "linear", sdm = sdm1,
int = TRUE, int.adj = TRUE)

## Example 2: logistic regression using a subset of the mtcars data
## Leave-one-out cross-validation-derived shrinkage
data(mtcars)
mtc.data <- cbind(1,datashape(mtcars, y = 8, x = c(1, 6, 9)))
head(mtc.data)
set.seed(123)
loocval(dataset = mtc.data, model = "logistic")



