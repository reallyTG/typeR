library(cosinor)


### Name: test_cosinor
### Title: Test for differences in a cosinor model
### Aliases: test_cosinor

### ** Examples

fit <- cosinor.lm(Y ~ time(time) + X + amp.acro(X), data = vitamind)
test_cosinor(fit, "X", "amp")



