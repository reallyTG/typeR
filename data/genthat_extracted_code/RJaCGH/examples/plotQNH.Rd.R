library(RJaCGH)


### Name: plotQNH
### Title: Plot transition probabilities
### Aliases: plotQNH
### Keywords: models

### ** Examples

## Model with two hidden states
## Note that RJaCGH normalizes distances to be between 0 and 1
x <- rexp(99)
x <- x/ max(x)
beta <- matrix(c(0, 1, 3, 0), 2, 2)
plotQNH(x=x, beta=beta, q=-beta, col=c(1,2))



