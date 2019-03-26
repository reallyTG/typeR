library(gensvm)


### Name: predict.gensvm.grid
### Title: Predict class labels from the GenSVMGrid class
### Aliases: predict.gensvm.grid

### ** Examples

## No test: 
x <- iris[, -5]
y <- iris[, 5]

# run a grid search
grid <- gensvm.grid(x, y)

# predict training sample
y.hat <- predict(grid, x)
## End(No test)




