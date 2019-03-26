library(trelliscopejs)


### Name: cog
### Title: Cast Column as a Cognostic
### Aliases: cog

### ** Examples

library(dplyr)
library(tidyr)
library(purrr)
library(ggplot2)
library(rbokeh)

mpg_cog <- mpg %>%
  group_by(manufacturer, class) %>%
  nest() %>%
  mutate(
    cogs = map_cog(data, ~ data_frame(
      mean_city_mpg = cog(mean(.$cty), desc = "Mean city mpg"),
      mean_hwy_mpg = cog(mean(.$hwy), desc = "Mean highway mpg"),
      most_common_drv = cog(tail(names(table(.$drv)), 1), desc = "Most common drive type")
    )),
    panel = map_plot(data, ~
      figure(., xlab = "City mpg", ylab = "Highway mpg",
        xlim = c(9, 47), ylim = c(7, 37)) %>%
        ly_points(cty, hwy,
          hover = list(year, model))
    )
  )

trelliscope(mpg_cog, name = "city_vs_highway_mpg", nrow = 1, ncol = 2)



