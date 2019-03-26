library(pcLasso)


### Name: predict.cv.pcLasso
### Title: Make predictions from a "cv.pcLasso" object
### Aliases: predict.cv.pcLasso

### ** Examples

set.seed(1)
x <- matrix(rnorm(100 * 20), 100, 20)
y <- rnorm(100)

cvfit <- cv.pcLasso(x, y, ratio = 0.8)
predict(cvfit, xnew = x[1:5, ])
predict(cvfit, xnew = x[1:5, ], s = "lambda.min")




