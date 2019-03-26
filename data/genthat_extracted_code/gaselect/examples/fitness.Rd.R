library(gaselect)


### Name: fitness
### Title: Get the fitness of a variable subset
### Aliases: fitness

### ** Examples

ctrl <- genAlgControl(populationSize = 100, numGenerations = 15, minVariables = 5,
    maxVariables = 12, verbosity = 1)

evaluator <- evaluatorPLS(numReplications = 2, innerSegments = 7, testSetSize = 0.4,
    numThreads = 1)

# Generate demo-data
set.seed(12345)
X <- matrix(rnorm(10000, sd = 1:5), ncol = 50, byrow = TRUE)
y <- drop(-1.2 + rowSums(X[, seq(1, 43, length = 8)]) + rnorm(nrow(X), 1.5));

result <- genAlg(y, X, control = ctrl, evaluator = evaluator, seed = 123)

fitness(result) # Get fitness of the found subsets

h <- fitnessEvolution(result) # Get average fitness as well as the fitness of the
                              # best chromosome for each generation (at raw scale!)

plot(h[, "mean"], type = "l", col = 1, ylim = c(-7, -1))
lines(h[, "mean"] - h[, "std.dev"], type = "l", col = "gray30", lty = 2)
lines(h[, "mean"] + h[, "std.dev"], type = "l", col = "gray30", lty = 2)
lines(h[, "best"], type = "l", col = 2)



