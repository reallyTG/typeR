library(ggstatsplot)


### Name: subtitle_t_onesample
### Title: Making text subtitle for one sample t-test and its nonparametric
###   and robust equivalents.
### Aliases: subtitle_t_onesample

### ** Examples


# for reproducibility
set.seed(123)

ggstatsplot::subtitle_t_onesample(
  data = iris,
  x = Sepal.Length,
  test.value = 5,
  type = "r"
)



