library(apricom)


### Name: bootval
### Title: Bootstrap-derived Shrinkage After Estimation
### Aliases: bootval

### ** Examples

## Example 1: Linear regression using the iris dataset
data(iris)
iris.data <- as.matrix(iris[, 1:4])
iris.data <- cbind(1, iris.data)
sdm1 <- matrix(c(0, 1, 1, 1), nrow = 1)
set.seed(777)
bootval(dataset = iris.data, model = "linear", N = 200, sdm = sdm1,
int = TRUE, int.adj = TRUE)

## Example 2: logistic regression using a subset of the mtcars data
data(mtcars)
mtc.data <- cbind(1,datashape(mtcars, y = 8, x = c(1, 6, 9)))
head(mtc.data)
set.seed(777)
bootval(dataset = mtc.data, model = "logistic", N = 500)



