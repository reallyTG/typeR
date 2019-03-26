library(cosinor)


### Name: summary.cosinor.lm
### Title: Summarize a cosinor model
### Aliases: summary.cosinor.lm

### ** Examples

fit <- cosinor.lm(Y ~ time(time) + X + amp.acro(X), data = vitamind)
summary(fit)



