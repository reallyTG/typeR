library(pch)


### Name: splinex
### Title: Including Interactions and Splines in Piecewise Constant Hazard
###   Regression
### Aliases: splinex
### Keywords: regression

### ** Examples


  require(splines)
  n <- 1000
  x1 <- runif(n,-2,2)
  x2 <- runif(n,-2,2)
  t <- rexp(n, exp(-abs(x1 - x2)))

  # a simple model
  model1 <- pchreg(Surv(t) ~ x1 + x2)

  # using splinex: the same as ~ ns(x1, df = 2) + ns(x2, df = 2)
  model2 <- pchreg(Surv(t) ~ x1 + x2, splinex = splinex("ns", v = 1))

  # include interaction: ~ ns(x1, df = 2) + ns(x2, df = 2) + ns(x1*x2, df = 2)
  model3 <- pchreg(Surv(t) ~ x1 * x2, splinex = splinex("ns", v = 1))

  # the same as model 3, only keep the PCs explaining at least 95 percent of the variance
  model4 <- pchreg(Surv(t) ~ x1 * x2, splinex = splinex("ns", v = 0.95))

  # true CDF vs fitted

  trueF <- pexp(t, exp(-abs(x1 - x2)))
  par(mfrow = c(2,2))
  plot(trueF, 1 - predict(model1)$Surv); abline(0,1, col = "red") # does not fit
  plot(trueF, 1 - predict(model2)$Surv); abline(0,1, col = "red") # neither
  plot(trueF, 1 - predict(model3)$Surv); abline(0,1, col = "red") # great!
  plot(trueF, 1 - predict(model4)$Surv); abline(0,1, col = "red") # almost as good



