library(ggstatsplot)


### Name: bf_two_sample_ttest
### Title: Bayesian two-samples _t_-test.
### Aliases: bf_two_sample_ttest

### ** Examples


# for reproducibility
set.seed(123)

# to get caption (default)
bf_two_sample_ttest(
  data = mtcars,
  x = am,
  y = wt,
  paired = FALSE,
  bf.prior = 0.880
)

# to see results
bf_two_sample_ttest(
  data = mtcars,
  x = am,
  y = wt,
  paired = FALSE,
  output = "results"
)

# for paired sample test
bf_two_sample_ttest(
  data = dplyr::filter(
    ggstatsplot::intent_morality,
    condition %in% c("accidental", "attempted"),
    harm == "Poisoning"
  ),
  x = condition,
  y = rating,
  paired = TRUE,
  output = "results"
)



