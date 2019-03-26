library(ggstatsplot)


### Name: ggpiestats
### Title: Pie charts with statistical tests
### Aliases: ggpiestats

### ** Examples


# for reproducibility
set.seed(123)

# simple function call with the defaults (without condition)
ggstatsplot::ggpiestats(
  data = ggplot2::msleep,
  main = vore,
  perc.k = 1,
  k = 2
)

# simple function call with the defaults (with condition)
ggstatsplot::ggpiestats(
  data = datasets::mtcars,
  main = vs,
  condition = cyl,
  bf.message = TRUE,
  nboot = 10,
  factor.levels = c("0 = V-shaped", "1 = straight"),
  legend.title = "Engine"
)

# simple function call with the defaults (without condition; with count data)
library(jmv)

ggstatsplot::ggpiestats(
  data = as.data.frame(HairEyeColor),
  main = Eye,
  counts = Freq
)



