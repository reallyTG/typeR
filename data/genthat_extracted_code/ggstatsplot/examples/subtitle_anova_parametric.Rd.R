library(ggstatsplot)


### Name: subtitle_anova_parametric
### Title: Making text subtitle for the between-subject anova designs.
### Aliases: subtitle_anova_parametric

### ** Examples

# with defaults
subtitle_anova_parametric(
  data = ggplot2::msleep,
  x = vore,
  y = sleep_rem,
  k = 3
)

# modifying the defaults
subtitle_anova_parametric(
  data = ggplot2::msleep,
  x = vore,
  y = sleep_rem,
  effsize.type = "biased",
  partial = FALSE,
  var.equal = TRUE,
  nboot = 10
)



