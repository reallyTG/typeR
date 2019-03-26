library(tidybayes)


### Name: density_bins
### Title: Density bins as data frames suitable for use with predict_curve
### Aliases: density_bins histogram_bins
### Keywords: manip

### ** Examples

## No test: 

library(ggplot2)
library(dplyr)
library(purrr)
library(tidyr)

if (
  require("rstanarm", quietly = TRUE) &&
  require("modelr", quietly = TRUE)
) {

  theme_set(theme_light())

  m_mpg = stan_glm(mpg ~ hp * cyl, data = mtcars)

  step = 1
  mtcars %>%
    group_by(cyl) %>%
    data_grid(hp = seq_range(hp, by = step)) %>%
    add_predicted_draws(m_mpg) %>%
    summarise_all(list) %>%
    mutate(densities = map(.prediction, density_bins)) %>%
    unnest(densities) %>%
    ggplot() +
    geom_rect(aes(
      xmin = hp - step/2, ymin = lower, ymax = upper, xmax = hp + step/2,
      fill = ordered(cyl), alpha = density
    )) +
    geom_point(aes(x = hp, y = mpg, fill = ordered(cyl)), shape = 21, data = mtcars) +
    scale_alpha_continuous(range = c(0, 1)) +
    scale_fill_brewer(palette = "Set2")
}
## End(No test)



