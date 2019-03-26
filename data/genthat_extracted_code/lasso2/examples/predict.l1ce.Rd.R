library(lasso2)


### Name: predict.l1ce
### Title: Predict Method for 'l1ce' Objects
### Aliases: predict.l1ce
### Keywords: models

### ** Examples

data(Iowa)
l1c.I <- l1ce(Yield ~ ., Iowa, bound = 10, absolute.t=TRUE)
p10 <- predict(l1c.I, newdata =   Iowa[10:19,])
stopifnot(all.equal(p10, fitted(l1c.I)[10:19]))



