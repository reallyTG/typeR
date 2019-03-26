library(ggstatsplot)


### Name: bf_one_sample_ttest
### Title: Bayesian one-sample _t_-test.
### Aliases: bf_one_sample_ttest

### ** Examples


# to get caption (default)
bf_one_sample_ttest(
  data = iris,
  x = Sepal.Length,
  test.value = 5.85,
  bf.prior = 0.8,
  output = "caption", k = 2
)

# to get results dataframe
bf_one_sample_ttest(
  data = iris,
  x = Sepal.Length,
  test.value = 5.85,
  bf.prior = 0.8,
  output = "results"
)



