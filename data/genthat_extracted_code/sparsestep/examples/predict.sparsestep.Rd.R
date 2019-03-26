library(sparsestep)


### Name: predict.sparsestep
### Title: Make predictions from a SparseStep model
### Aliases: predict predict.sparsestep

### ** Examples

x <- matrix(rnorm(100*20), 100, 20)
y <- rnorm(100)
fit <- sparsestep(x, y)
yhat <- predict(fit, x)




