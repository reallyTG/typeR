library(extraDistr)


### Name: TukeyLambda
### Title: Tukey lambda distribution
### Aliases: TukeyLambda qtlambda rtlambda
### Keywords: distribution

### ** Examples


pp = seq(0, 1, by = 0.001)
partmp <- par(mfrow = c(2,3))
plot(qtlambda(pp, -1), pp, type = "l", main = "lambda = -1 (Cauchy)")
plot(qtlambda(pp, 0), pp, type = "l", main = "lambda = 0 (logistic)")
plot(qtlambda(pp, 0.14), pp, type = "l", main = "lambda = 0.14 (normal)")
plot(qtlambda(pp, 0.5), pp, type = "l", main = "lambda = 0.5 (concave)")
plot(qtlambda(pp, 1), pp, type = "l", main = "lambda = 1 (uniform)")
plot(qtlambda(pp, 2), pp, type = "l", main = "lambda = 2 (uniform)")

hist(rtlambda(1e5, -1), freq = FALSE, main = "lambda = -1 (Cauchy)")
hist(rtlambda(1e5, 0), freq = FALSE, main = "lambda = 0 (logistic)")
hist(rtlambda(1e5, 0.14), freq = FALSE, main = "lambda = 0.14 (normal)")
hist(rtlambda(1e5, 0.5), freq = FALSE, main = "lambda = 0.5 (concave)")
hist(rtlambda(1e5, 1), freq = FALSE, main = "lambda = 1 (uniform)")
hist(rtlambda(1e5, 2), freq = FALSE, main = "lambda = 2 (uniform)")
par(partmp)




