library(psycho)


### Name: crawford.test
### Title: Crawford-Garthwaite (2007) Bayesian test for single-case
###   analysis.
### Aliases: crawford.test

### ** Examples

library(psycho)

crawford.test(patient = 125, mean = 100, sd = 15, n = 100)
plot(crawford.test(patient = 80, mean = 100, sd = 15, n = 100))

crawford.test(patient = 10, controls = c(0, -2, 5, 2, 1, 3, -4, -2))
test <- crawford.test(patient = 7, controls = c(0, -2, 5, -6, 0, 3, -4, -2))
plot(test)



