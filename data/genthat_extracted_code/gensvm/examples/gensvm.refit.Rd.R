library(gensvm)


### Name: gensvm.refit
### Title: Train an already fitted model on new data
### Aliases: gensvm.refit

### ** Examples

x <- iris[, -5]
y <- iris[, 5]

# fit a standard model and refit with slightly different parameters
fit <- gensvm(x, y)
fit2 <- gensvm.refit(fit, x, y, epsilon=1e-8)

## No test: 
# refit a model returned by a grid search
grid <- gensvm.grid(x, y)
fit <- gensvm.refit(fit, x, y, epsilon=1e-8)
## End(No test)

# refit on different data
idx <- runif(nrow(x)) > 0.5
x1 <- x[idx, ]
x2 <- x[!idx, ]
y1 <- y[idx]
y2 <- y[!idx]

fit1 <- gensvm(x1, y1)
fit2 <- gensvm.refit(fit1, x2, y2)




