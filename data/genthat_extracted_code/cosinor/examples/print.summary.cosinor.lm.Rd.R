library(cosinor)


### Name: print.summary.cosinor.lm
### Title: Print the summary of a cosinor model
### Aliases: print.summary.cosinor.lm

### ** Examples

fit <- cosinor.lm(Y ~ time(time) + X + amp.acro(X), data = vitamind)
summary(fit)



