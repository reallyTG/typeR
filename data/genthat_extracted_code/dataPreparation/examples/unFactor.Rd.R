library(dataPreparation)


### Name: unFactor
### Title: Unfactor factor with too many values
### Aliases: unFactor

### ** Examples

# Let's build a dataSet
dataSet <- data.frame(true_factor = factor(rep(c(1,2), 13)),
                      false_factor = factor(LETTERS))
                      
# Let's un factorize all factor that have more than 5 different values
dataSet <- unFactor(dataSet, n_unfactor = 5)
sapply(dataSet, class)
# Let's un factorize all factor that have more than 5 different values
dataSet <- unFactor(dataSet, n_unfactor = 0)
sapply(dataSet, class)




