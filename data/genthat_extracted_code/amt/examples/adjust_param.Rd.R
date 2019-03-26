library(amt)


### Name: adjust_param
### Title: Adjust parameters
### Aliases: adjust_param adjust_shape adjust_scale adjust_kappa

### ** Examples

# Using the deer data set
data(deer)
data(sh_forest)

# first prepare the data and fit a model
m1 <- deer %>% steps_by_burst() %>%
  random_steps() %>%
  extract_covariates(sh_forest) %>%
  mutate(sh.forest = factor(sh.forest)) %>%
  fit_clogit(case_ ~ sh.forest * log(sl_) + sl_ + strata(step_id_))



# Investigate and adjust parameters ---------------------------------------

sl_params(m1)['shape', 'est']
# adjust shape with the log of the step length
sh1 <- adjust_shape(sl_params(m1)['shape', 'est'],
             modifier = coef(m1)['log(sl_)'])

sl_params(m1)['scale', 'est']
# adjust shape with the step length
sc1 <- adjust_shape(sl_params(m1)['scale', 'est'],
             modifier = coef(m1)['sl_'])

# Up to now we have ignored the interaction with forest
# this means the above assumes that forest = 2 (= non forest)

sl_params(m1)['shape', 'est']
# adjust shape with the log of the step length
sh2 <- adjust_shape(tentative = sl_params(m1)['shape', 'est'],
                    modifier = coef(m1)['log(sl_)'] + coef(m1)['sh.forest2:log(sl_)'])

# The modified shape paremeter differ for forest and non forest.
# The shape for steps that end in forest are lower.
sh1
sh2

# This can be best seen when plotting the tentative Gamma distribution (black) and
# adding lines for Gamma distributions with adjusted shape paremeters
# for open areas (red) and forested areas (green).
## Not run: 
##D plot_sl(m1)
##D curve(dgamma(x, shape = sh1, scale = sc1), col = "red", add = TRUE, from = 0.1)
##D curve(dgamma(x, shape = sh2, scale = sc1), col = "forestgreen", add = TRUE, from = 0.1)
## End(Not run)




