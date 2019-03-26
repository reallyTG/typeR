library(ggstatsplot)


### Name: bf_oneway_anova
### Title: Bayesian one-way analysis of variance.
### Aliases: bf_oneway_anova

### ** Examples


# to get caption (default)
bf_oneway_anova(
  data = iris,
  x = Species,
  y = Sepal.Length,
  bf.prior = 0.8
)

# to get results dataframe
bf_oneway_anova(
  data = iris,
  x = Species,
  y = Sepal.Length,
  bf.prior = 0.8,
  output = "results"
)



