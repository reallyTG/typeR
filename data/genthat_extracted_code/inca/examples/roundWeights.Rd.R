library(inca)


### Name: roundWeights
### Title: Function for Rounding Weights
### Aliases: roundWeights

### ** Examples

library(inca)
set.seed(0)
w <- rpois(150, 4)
data <- matrix(rbinom(150000, 1, .3) * rpois(150000, 4), 1000, 150)
y <- data %*% w
w <- runif(150, 0, 7.5)
rw <- roundWeights(w, ~. + 0, y, lower = 1, upper = 7, sparse = TRUE, data = data)
barplot(table(rw), main = "Rounded weigths")




