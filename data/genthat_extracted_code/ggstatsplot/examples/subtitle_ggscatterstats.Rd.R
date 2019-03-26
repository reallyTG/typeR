library(ggstatsplot)


### Name: subtitle_ggscatterstats
### Title: Making text subtitle for the correlation test.
### Aliases: subtitle_ggscatterstats

### ** Examples


# without changing defaults
subtitle_ggscatterstats(
  data = ggplot2::midwest,
  x = area,
  y = percblack
)

# changing defaults
subtitle_ggscatterstats(
  data = ggplot2::midwest,
  x = area,
  y = percblack,
  nboot = 25,
  beta = 0.2,
  type = "r",
  k = 1
)



