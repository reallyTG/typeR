library(AID)


### Name: boxcoxfr
### Title: Box-Cox Transformation for One-Way Independent Groups Designs
### Aliases: boxcoxfr
### Keywords: functions

### ** Examples


library(AID)

data(AADT)
attach(AADT)
out <- boxcoxfr(aadt, class)
out$shapiro
out$bartlett
out$tf.data
confInt(out, level = 0.95)


data <- rnorm(120, 10, 1)
factor <- rep(c("X", "Y", "Z"), each = 40)
out <- boxcoxfr(data, factor, lambda = seq(-5, 5, 0.01), tau = 0.01, alpha = 0.01)
confInt(out, level = 0.95)





