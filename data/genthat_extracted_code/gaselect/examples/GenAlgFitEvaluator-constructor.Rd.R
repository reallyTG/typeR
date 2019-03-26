library(gaselect)


### Name: evaluatorFit
### Title: Fit Evaluator
### Aliases: evaluatorFit

### ** Examples

ctrl <- genAlgControl(populationSize = 200, numGenerations = 30, minVariables = 5,
    maxVariables = 12, verbosity = 1)
evaluator <- evaluatorFit(statistic = "BIC", numThreads = 1)

# Generate demo-data
set.seed(12345)
X <- matrix(rnorm(10000, sd = 1:5), ncol = 50, byrow = TRUE)
y <- drop(-1.2 + rowSums(X[, seq(1, 43, length = 8)]) + rnorm(nrow(X), 1.5));

result <- genAlg(y, X, control = ctrl, evaluator = evaluator, seed = 123)

subsets(result, 1:5)



