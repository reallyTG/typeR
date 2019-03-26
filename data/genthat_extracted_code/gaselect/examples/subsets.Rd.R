library(gaselect)


### Name: subsets
### Title: Get the found variable subset(s)
### Aliases: subsets

### ** Examples

ctrl <- genAlgControl(populationSize = 200, numGenerations = 15, minVariables = 5,
    maxVariables = 12, verbosity = 1)

evaluator <- evaluatorPLS(numReplications = 2, innerSegments = 7, testSetSize = 0.4,
    numThreads = 1)

# Generate demo-data
set.seed(12345)
X <- matrix(rnorm(10000, sd = 1:5), ncol = 50, byrow = TRUE)
y <- drop(-1.2 + rowSums(X[, seq(1, 43, length = 8)]) + rnorm(nrow(X), 1.5));

result <- genAlg(y, X, control = ctrl, evaluator = evaluator, seed = 123)

subsets(result, names = TRUE, indices = 1:5) # best 5 variable subsets as a list of names
result@subsets[ , 1:5] # best 5 variable subsets as a logical matrix with the subsets in the columns



