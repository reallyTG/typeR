library(tidybayes)


### Name: add_fitted_draws
### Title: Add draws from (possibly transformed) posterior linear
###   predictors (the "fit") or from posterior predictions of a model to a
###   data frame
### Aliases: add_fitted_draws fitted_draws fitted_draws.default
###   fitted_draws.stanreg fitted_draws.brmsfit add_linpred_draws
###   linpred_draws add_predicted_draws predicted_draws
###   predicted_draws.default predicted_draws.stanreg
###   predicted_draws.brmsfit
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

  # draw 100 fit lines from the posterior and overplot them
  mtcars %>%
    group_by(cyl) %>%
    data_grid(hp = seq_range(hp, n = 101)) %>%
    add_fitted_draws(m_mpg, n = 100) %>%
    ggplot(aes(x = hp, y = mpg, color = ordered(cyl))) +
    geom_line(aes(y = .value, group = paste(cyl, .draw)), alpha = 0.25) +
    geom_point(data = mtcars)

  # plot posterior predictive intervals
  mtcars %>%
    group_by(cyl) %>%
    data_grid(hp = seq_range(hp, n = 101)) %>%
    add_predicted_draws(m_mpg) %>%
    ggplot(aes(x = hp, y = mpg, color = ordered(cyl))) +
    stat_lineribbon(aes(y = .prediction), .width = c(.99, .95, .8, .5), alpha = 0.25) +
    geom_point(data = mtcars) +
    scale_fill_brewer(palette = "Greys")
}
## End(No test)



