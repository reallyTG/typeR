library(ggstatsplot)


### Name: subtitle_t_bayes
### Title: Making text subtitle for the bayesian t-test.
### Aliases: subtitle_t_bayes

### ** Examples

# for reproducibility
set.seed(123)

# between-subjects design

subtitle_t_bayes(
  data = mtcars,
  x = am,
  y = wt,
  paired = FALSE
)

# within-subjects design

subtitle_t_bayes(
  data = dplyr::filter(
    ggstatsplot::intent_morality,
    condition %in% c("accidental", "attempted"),
    harm == "Poisoning"
  ),
  x = condition,
  y = rating,
  paired = TRUE
)



