## ------------------------------------------------------------------------
library(chemCal)
m0 <- lm(y ~ x, data = massart97ex3)
calplot(m0)

## ------------------------------------------------------------------------
plot(m0, which=3)

## ---- message = FALSE, echo = TRUE---------------------------------------
weights <- with(massart97ex3, {
  yx <- split(y, x)
  ybar <- sapply(yx, mean)
  s <- round(sapply(yx, sd), digits = 2)
  w <- round(1 / (s^2), digits = 3)
})
massart97ex3.means <- aggregate(y ~ x, massart97ex3, mean)

m <- lm(y ~ x, w = weights, data = massart97ex3.means)

## ------------------------------------------------------------------------
inverse.predict(m, 15, ws=1.67)
inverse.predict(m, 90, ws = 0.145)

