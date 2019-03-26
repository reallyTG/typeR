library(bayesplot)


### Name: bayesplot_theme_get
### Title: Get, set, and modify the active bayesplot theme
### Aliases: bayesplot_theme_get bayesplot_theme_set bayesplot_theme_update
###   bayesplot_theme_replace

### ** Examples

library(ggplot2)

# plot using the current value of bayesplot_theme_get()
# (the default is bayesplot::theme_default())
x <- example_mcmc_draws()
mcmc_hist(x)

# change the bayesplot theme to theme_minimal and save the old theme
old <- bayesplot_theme_set(theme_minimal())
mcmc_hist(x)

# change back to the previous theme
bayesplot_theme_set(old)
mcmc_hist(x)

# change the default font size and family for bayesplots
bayesplot_theme_update(text = element_text(size = 16, family = "sans"))
mcmc_hist(x)

# change back to the default
bayesplot_theme_set() # same as bayesplot_theme_set(theme_default())
mcmc_hist(x)

# updating theme elements
color_scheme_set("brightblue")
bayesplot_theme_set(theme_dark())
mcmc_hist(x)

bayesplot_theme_update(panel.background = element_rect(fill = "black"))
mcmc_hist(x)

# to get the same plot without updating the theme we could also have
# used the bayeplot convenience function panel_bg()
bayesplot_theme_set(theme_dark())
mcmc_hist(x) + panel_bg(fill = "black")




