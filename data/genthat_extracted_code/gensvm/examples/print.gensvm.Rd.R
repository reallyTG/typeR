library(gensvm)


### Name: print.gensvm
### Title: Print the fitted GenSVM model
### Aliases: print.gensvm

### ** Examples

x <- iris[, -5]
y <- iris[, 5]

# fit and print the model
fit <- gensvm(x, y)
print(fit)

# (advanced) use the fact that print returns the fitted model
fit <- gensvm(x, y)
predict(print(fit), x)




