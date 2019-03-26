library(ggstatsplot)


### Name: subtitle_template
### Title: Template for subtitles with statistical details for tests with a
###   single parameter (e.g., t, chi-squared, etc.)
### Aliases: subtitle_template

### ** Examples

set.seed(123)

# subtitle for *t*-statistic with Cohen's *d* as effect size
ggstatsplot::subtitle_template(
  no.parameters = 1L,
  statistic.text = quote(italic("t")),
  statistic = 5.494,
  parameter = 29.234,
  p.value = 0.00001,
  effsize.text = quote(italic("d")),
  effsize.estimate = -1.980,
  effsize.LL = -2.873,
  effsize.UL = -1.088,
  n = 32L,
  conf.level = 0.95,
  k = 3L,
  k.parameter = 3L
)



