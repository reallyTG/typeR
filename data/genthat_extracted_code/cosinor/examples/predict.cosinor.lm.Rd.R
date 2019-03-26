library(cosinor)


### Name: predict.cosinor.lm
### Title: Predict from a cosinor model
### Aliases: predict.cosinor.lm

### ** Examples

fit <- cosinor.lm(Y ~ time(time) + X + amp.acro(X), data = vitamind)
predict(fit)



