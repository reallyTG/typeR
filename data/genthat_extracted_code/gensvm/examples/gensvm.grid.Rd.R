library(gensvm)


### Name: gensvm.grid
### Title: Cross-validated grid search for GenSVM
### Aliases: gensvm.grid

### ** Examples

x <- iris[, -5]
y <- iris[, 5]

## No test: 
# use the default parameter grid
grid <- gensvm.grid(x, y, verbose=TRUE)
## End(No test)

# use a smaller parameter grid
pg <- expand.grid(p=c(1.0, 1.5, 2.0), kappa=c(-0.9, 1.0), epsilon=c(1e-3))
grid <- gensvm.grid(x, y, param.grid=pg)

# print the result
print(grid)

## No test: 
# Using a custom scoring function (accuracy as percentage)
acc.pct <- function(yt, yp) { return (100 * sum(yt == yp) / length(yt)) }
grid <- gensvm.grid(x, y, scoring=acc.pct)

# With RBF kernel and very verbose progress printing
pg <- expand.grid(kernel=c('rbf'), gamma=c(1e-2, 1e-1, 1, 1e1, 1e2),
                  lambda=c(1e-8, 1e-6), max.iter=c(5000))
grid <- gensvm.grid(x, y, param.grid=pg, verbose=2)
## End(No test)




