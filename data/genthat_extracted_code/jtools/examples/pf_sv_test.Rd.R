library(jtools)


### Name: pf_sv_test
### Title: Test whether sampling weights are needed
### Aliases: pf_sv_test

### ** Examples


# Note: This is a contrived example to show how the function works,
# not a case with actual sammpling weights from a survey vendor
if (requireNamespace("boot")) {
  states <- as.data.frame(state.x77)
  set.seed(100)
  states$wts <- runif(50, 0, 3)
  fit <- lm(Murder ~ Illiteracy + Frost, data = states)
  pf_sv_test(model = fit, data = states, weights = wts, sims = 100)
}




