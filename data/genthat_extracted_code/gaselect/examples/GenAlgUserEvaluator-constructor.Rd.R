library(gaselect)


### Name: evaluatorUserFunction
### Title: User Defined Evaluator
### Aliases: evaluatorUserFunction

### ** Examples

ctrl <- genAlgControl(populationSize = 100, numGenerations = 10, minVariables = 5,
    maxVariables = 12, verbosity = 1)

# Use the BIC of a linear model to evaluate the fitness of a variable subset
evalFUN <- function(y, X) {
		return(BIC(lm(y ~ X)));
}

# Dummy function that returns the residuals standard deviation and not the SEP
sepFUN <- function(genAlg) {
    return(apply(genAlg@subsets, 2, function(subset) {
		m <- lm(genAlg@response ~ genAlg@covariates[, subset]);
		return(sd(m$residuals));
	}));
}

evaluator <- evaluatorUserFunction(FUN = evalFUN, sepFUN = sepFUN)

# Generate demo-data
set.seed(12345)
X <- matrix(rnorm(10000, sd = 1:5), ncol = 50, byrow = TRUE)
y <- drop(-1.2 + rowSums(X[, seq(1, 43, length = 8)]) + rnorm(nrow(X), 1.5));

result <- genAlg(y, X, control = ctrl, evaluator = evaluator, seed = 123)

subsets(result, 1:5)



