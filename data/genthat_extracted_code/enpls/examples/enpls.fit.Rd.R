library(enpls)


### Name: enpls.fit
### Title: Ensemble Partial Least Squares Regression
### Aliases: enpls.fit

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
fit = enpls.fit(x, y, reptimes = 50)
print(fit)
predict(fit, newx = x)



