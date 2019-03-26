library(enpls)


### Name: print.enpls.fit
### Title: Print Fitted Ensemble Partial Least Squares Object
### Aliases: print.enpls.fit

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
fit = enpls.fit(x, y, reptimes = 50)
print(fit)



