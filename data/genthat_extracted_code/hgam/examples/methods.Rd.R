library(hgam)


### Name: methods.hgam
### Title: Methods for displaying information about high-dimensional
###   generalized additive models
### Aliases: methods.hgam print.hgam plot.hgam fitted.hgam coef.hgam
###   predict.hgam logLik.hgam print.hrisk
### Keywords: methods

### ** Examples

test.d <- dgp(1000)
test.m <- hgam(y ~ ., data = test.d)

print(test.m)
coef(test.m)
fitted(test.m)
predict(test.m)
logLik(test.m)
plot(test.m, which = c("x1", "x2"), multidim = TRUE)



