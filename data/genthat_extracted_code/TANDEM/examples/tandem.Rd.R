library(TANDEM)


### Name: tandem
### Title: Fits a TANDEM model by performing a two-stage regression
### Aliases: tandem

### ** Examples

# unpack example data
x = example_data$x
y = example_data$y
upstream = example_data$upstream

# fit a tandem model, determine the coefficients and create a prediction
fit = tandem(x, y, upstream, alpha=0.5)
beta = coef(fit)
y_hat = predict(fit, newx=x)



