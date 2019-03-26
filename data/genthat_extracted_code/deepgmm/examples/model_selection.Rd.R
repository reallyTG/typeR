library(deepgmm)


### Name: model_selection
### Title: Function to compare different models
### Aliases: model_selection
### Keywords: cluster models multivariate

### ** Examples

## No test: 
layers <- 2
k <- c(3, 4) 
r <- c(3, 2)
it <- 50
eps <- 0.001
y <- scale(mtcars)

sel <- model_selection(y, layers, 3, seeds = 1, it = 250, eps = 0.001)
sel

summary(sel)
## End(No test)



