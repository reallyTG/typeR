library(bayeslm)


### Name: predict.bayeslm.fit
### Title: Predict new data
### Aliases: predict.bayeslm.fit
### Keywords: univar

### ** Examples

x = matrix(rnorm(1000), 100, 10)
y = x %*% rnorm(10) + rnorm(100)
data = list(x = x, y = y)

# Train the model with formula input
fit1 = bayeslm(y ~ x, data = data)
# predict
pred1 = predict(fit1, data)

# Train the model with matrices input
fit2 = bayeslm(Y = y, X = x)
pred2 = predict(fit2, X = x)



