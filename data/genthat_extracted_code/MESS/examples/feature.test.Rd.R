library(MESS)


### Name: feature.test
### Title: Inference for features identified by the Lasso
### Aliases: feature.test
### Keywords: ~htests

### ** Examples



# Simulate some data
x <- matrix(rnorm(30*100), nrow=30)
y <- rnorm(30, mean=1*x[,1])

# Make inference for features
## Not run: feature.test(x, y)





