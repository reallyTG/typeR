library(chemCal)


### Name: inverse.predict
### Title: Predict x from y for a linear calibration
### Aliases: inverse.predict inverse.predict.lm inverse.predict.rlm
###   inverse.predict.default
### Keywords: manip

### ** Examples

# This is example 7 from Chapter 8 in Massart et al. (1997)
m <- lm(y ~ x, data = massart97ex1)
inverse.predict(m, 15)        #  6.1 +- 4.9
inverse.predict(m, 90)        # 43.9 +- 4.9
inverse.predict(m, rep(90,5)) # 43.9 +- 3.2

# For reproducing the results for replicate standard measurements in example 8,
# we need to do the calibration on the means when using chemCal > 0.2
weights <- with(massart97ex3, {
  yx <- split(y, x)
  ybar <- sapply(yx, mean)
  s <- round(sapply(yx, sd), digits = 2)
  w <- round(1 / (s^2), digits = 3)
})

massart97ex3.means <- aggregate(y ~ x, massart97ex3, mean)

m3.means <- lm(y ~ x, w = weights, data = massart97ex3.means)

inverse.predict(m3.means, 15, ws = 1.67)  # 5.9 +- 2.5
inverse.predict(m3.means, 90, ws = 0.145) # 44.1 +- 7.9




