library(cosinor)


### Name: ggplot.cosinor.lm
### Title: Plot a cosinor model
### Aliases: ggplot.cosinor.lm

### ** Examples

fit <- cosinor.lm(Y ~ time(time) + X + amp.acro(X), data = vitamind)
ggplot.cosinor.lm(fit, "X")



