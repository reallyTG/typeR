library(jtools)


### Name: weights_tests
### Title: Test whether sampling weights are needed
### Aliases: weights_tests

### ** Examples


# Note: This is a contrived example to show how the function works,
# not a case with actual sammpling weights from a survey vendor
if (requireNamespace("boot")) {
  states <- as.data.frame(state.x77)
  set.seed(100)
  states$wts <- runif(50, 0, 3)
  fit <- lm(Murder ~ Illiteracy + Frost, data = states)
  weights_tests(model = fit, data = states, weights = wts, sims = 100)
}




