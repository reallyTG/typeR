library(apricom)


### Name: splitval
### Title: Split-sample-derived Shrinkage After Estimation
### Aliases: splitval

### ** Examples

## Example 1: Linear regression using the iris dataset
## Split-sample-derived shrinkage with 100 rounds of sample-splitting
data(iris)
iris.data <- as.matrix(iris[, 1:4])
iris.data <- cbind(1, iris.data)
sdm1 <- matrix(c(0, 1, 1, 1), nrow = 1)
set.seed(321)
splitval(dataset = iris.data, model = "linear", nrounds = 100,
fract = 0.75, sdm = sdm1, int = TRUE, int.adj = TRUE)

## Example 2: logistic regression using a subset of the mtcars data
## Split-sample-derived shrinkage
data(mtcars)
mtc.data <- cbind(1,datashape(mtcars, y = 8, x = c(1, 6, 9)))
head(mtc.data)
set.seed(123)
splitval(dataset = mtc.data, model = "logistic",
nrounds = 100, fract = 0.5)



