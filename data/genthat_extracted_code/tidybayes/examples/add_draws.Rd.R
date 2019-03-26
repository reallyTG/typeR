library(tidybayes)


### Name: add_draws
### Title: Add draws to a data frame in tidy format
### Aliases: add_draws
### Keywords: manip

### ** Examples

## No test: 

library(ggplot2)
library(dplyr)

if (
  require("rstanarm", quietly = TRUE) &&
  require("modelr", quietly = TRUE)
) {

  theme_set(theme_light())

  m_mpg = stan_glm(mpg ~ hp * cyl, data = mtcars,
    # 1 chain / few iterations just so example runs quickly
    # do not use in practice
    chains = 1, iter = 500)

  # plot posterior predictive intervals
  mtcars %>%
    group_by(cyl) %>%
    data_grid(hp = seq_range(hp, n = 101)) %>%
    # the line below is equivalent to add_fitted_draws(m_mpg), except that it does not
    # standardize arguments across model types
    add_draws(posterior_linpred(m_mpg, newdata = .)) %>%
    ggplot(aes(x = hp, y = mpg, color = ordered(cyl))) +
    stat_lineribbon(aes(y = .value), alpha = 0.25) +
    geom_point(data = mtcars) +
    scale_fill_brewer(palette = "Greys")
}
## End(No test)



