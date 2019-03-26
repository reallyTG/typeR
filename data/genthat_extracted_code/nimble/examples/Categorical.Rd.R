library(nimble)


### Name: Categorical
### Title: The Categorical Distribution
### Aliases: Categorical dcat rcat

### ** Examples

probs <- c(1/4, 1/10, 1 - 1/4 - 1/10)
x <- rcat(n = 30, probs)
dcat(x, probs)




