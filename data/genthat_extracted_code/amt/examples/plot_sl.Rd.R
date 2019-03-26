library(amt)


### Name: plot_sl
### Title: Plot step-length distribution
### Aliases: plot_sl plot_sl.fit_clogit plot_sl.random_steps

### ** Examples

data(deer)

# with random steps
deer %>% steps_by_burst %>% random_steps %>% plot_sl
deer %>% steps_by_burst %>% random_steps %>% plot_sl(upper_quantile = 0.5)

# with fitted ssf
deer %>% steps_by_burst %>% random_steps %>%
  fit_ssf(case_ ~ sl_ + strata(step_id_)) %>% plot_sl




