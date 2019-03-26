library(foba)


### Name: predict.foba
### Title: Make predictions or extract coefficients from a fitted foba
###   model
### Aliases: predict.foba
### Keywords: regression methods

### ** Examples

data(boston)

model <- foba(boston$x,boston$y,s=20,nu=0.9)

### make predictions at the values in x, at sparsity level 5

py <- predict(model, boston$x, k=5, type="fit")

print(paste("mean squared error =", mean((py$fit-boston$y)^2)))

### extract the coefficient vector at sparsity level 5
coef <- predict(model, k=5, type="coef")
print("top five variables:")
coef$selected.variables




