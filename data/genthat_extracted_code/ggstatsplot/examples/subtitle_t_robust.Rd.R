library(ggstatsplot)


### Name: subtitle_t_robust
### Title: Making text subtitle for the robust t-test (between- and
###   within-subjects designs).
### Aliases: subtitle_t_robust

### ** Examples


# with defaults
subtitle_t_robust(
  data = sleep,
  x = group,
  y = extra
)

# changing defaults
subtitle_t_robust(
  data = ToothGrowth,
  x = supp,
  y = len,
  nboot = 10,
  k = 1,
  tr = 0.2
)

# within-subjects design
ggstatsplot::subtitle_t_robust(
  data = dplyr::filter(
    ggstatsplot::intent_morality,
    condition %in% c("accidental", "attempted"),
    harm == "Poisoning"
  ),
  x = condition,
  y = rating,
  paired = TRUE,
  nboot = 25
)



