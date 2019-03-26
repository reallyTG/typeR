library(ggstatsplot)


### Name: bf_corr_test
### Title: Bayesian correlation test.
### Aliases: bf_corr_test

### ** Examples


# for reproducibility
set.seed(123)

# to get caption (default)
bf_corr_test(
  data = anscombe,
  x = x1,
  y = y4,
  bf.prior = 1
)

# to see results
bf_corr_test(
  data = anscombe,
  x = x1,
  y = y4,
  bf.prior = 0.8,
  output = "results"
)



