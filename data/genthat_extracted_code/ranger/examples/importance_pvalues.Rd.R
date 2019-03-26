library(ranger)


### Name: importance_pvalues
### Title: ranger variable importance p-values
### Aliases: importance_pvalues

### ** Examples

require(ranger)

## Janitza's p-values with corrected Gini importance
n <- 50
p <- 400
dat <- data.frame(y = factor(rbinom(n, 1, .5)), replicate(p, runif(n)))
rf.sim <- ranger(y ~ ., dat, importance = "impurity_corrected")
importance_pvalues(rf.sim, method = "janitza")

## Permutation p-values 
## Not run: 
##D rf.iris <- ranger(Species ~ ., data = iris, importance = 'permutation')
##D importance_pvalues(rf.iris, method = "altmann", formula = Species ~ ., data = iris)
## End(Not run)



