library(ggstatsplot)


### Name: subtitle_t_parametric
### Title: Making text subtitle for the t-test (between-/within-subjects
###   designs).
### Aliases: subtitle_t_parametric

### ** Examples


# creating a smaller dataset
msleep_short <- dplyr::filter(
  .data = ggplot2::msleep,
  vore %in% c("carni", "herbi")
)

# with defaults
subtitle_t_parametric(
  data = msleep_short,
  x = vore,
  y = sleep_rem
)

# changing defaults
subtitle_t_parametric(
  data = msleep_short,
  x = vore,
  y = sleep_rem,
  var.equal = TRUE,
  k = 2,
  effsize.type = "d"
)



