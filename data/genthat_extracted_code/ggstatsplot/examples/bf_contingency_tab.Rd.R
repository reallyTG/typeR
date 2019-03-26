library(ggstatsplot)


### Name: bf_contingency_tab
### Title: Bayesian contingency table analysis.
### Aliases: bf_contingency_tab

### ** Examples


# for reproducibility
set.seed(123)

# to get caption (default)
bf_contingency_tab(
  data = mtcars,
  main = am,
  condition = cyl,
  fixed.margin = "cols"
)

# to see results
bf_contingency_tab(
  data = mtcars,
  main = am,
  condition = cyl,
  sampling.plan = "jointMulti",
  fixed.margin = "rows",
  prior.concentration = 1
)



