library(enpls)


### Name: cv.enpls
### Title: Cross Validation for Ensemble Partial Least Squares Regression
### Aliases: cv.enpls

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
cvfit = cv.enpls(x, y, reptimes = 10)
print(cvfit)
plot(cvfit)



