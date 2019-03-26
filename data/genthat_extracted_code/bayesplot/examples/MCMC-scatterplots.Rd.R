library(bayesplot)


### Name: MCMC-scatterplots
### Title: Scatterplots of MCMC draws
### Aliases: MCMC-scatterplots mcmc_scatter mcmc_hex mcmc_pairs
###   scatter_style_np pairs_style_np pairs_condition

### ** Examples

library("ggplot2")

# some parameter draws to use for demonstration
x <- example_mcmc_draws(params = 6)
dimnames(x)

# scatterplot of alpha vs log(sigma)
color_scheme_set("teal")
(p <- mcmc_scatter(x, pars = c("alpha", "sigma"),
                  transform = list(sigma = "log")))
p +
  labs(
    title = "Insert your own headline-grabbing title",
    subtitle = "with a provocative subtitle",
    caption = "and a controversial caption",
    x = expression(alpha),
    y = expression(log(sigma))
   )

# add ellipse
p + stat_ellipse(level = 0.9, color = "gray20", size = 1)

# add contour
color_scheme_set("red")
p2 <- mcmc_scatter(x, pars = c("alpha", "sigma"), size = 3.5, alpha = 0.25)
p2 + stat_density_2d(color = "black", size = .5)

# can also add lines/smooths
color_scheme_set("pink")
(p3 <- mcmc_scatter(x, pars = c("alpha", "beta[3]"), alpha = 0.25, size = 3))
p3 + geom_smooth(method = "lm", se = FALSE, color = "gray20",
                 size = .75, linetype = 2)

## No test: 
# hexagonal heatmap
color_scheme_set("brightblue")
(p <- mcmc_hex(x, pars = c("sigma", "alpha"), transform = list(sigma = "log")))
p + plot_bg(fill = "gray95")
p + plot_bg(fill = "gray95") + panel_bg(fill = "gray70")
## End(No test)
## No test: 
color_scheme_set("purple")

# pairs plots
# default of condition=NULL implies splitting chains between upper and lower panels
mcmc_pairs(x, pars = "alpha", regex_pars = "beta\\[[1,4]\\]",
           off_diag_args = list(size = 1, alpha = 0.5))

# change to density plots instead of histograms and hex plots instead of
# scatterplots
mcmc_pairs(x, pars = "alpha", regex_pars = "beta\\[[1,4]\\]",
           diag_fun = "dens", off_diag_fun = "hex")

# plot chain 1 above diagonal and chains 2, 3, and 4 below
color_scheme_set("brightblue")
mcmc_pairs(x, pars = "alpha", regex_pars = "beta\\[[1,4]\\]",
           diag_fun = "dens", off_diag_fun = "hex",
           condition = pairs_condition(chains = list(1, 2:4)))
## End(No test)

## Not run: 
##D ### Adding NUTS diagnostics to scatterplots and pairs plots
##D 
##D # examples using rstanarm package
##D library(rstanarm)
##D 
##D # for demonstration purposes, intentionally fit a model that
##D # will (almost certainly) have some divergences
##D fit <- stan_glm(
##D   mpg ~ ., data = mtcars,
##D   iter = 1000,
##D   # this combo of prior and adapt_delta should lead to some divergences
##D   prior = hs(),
##D   adapt_delta = 0.9
##D )
##D posterior <- as.array(fit)
##D np <- nuts_params(fit)
##D 
##D # mcmc_scatter with divergences highlighted
##D color_scheme_set("brightblue")
##D mcmc_scatter(posterior, pars = c("wt", "sigma"), np = np)
##D 
##D color_scheme_set("darkgray")
##D div_style <- scatter_style_np(div_color = "green", div_shape = 4, div_size = 4)
##D mcmc_scatter(posterior, pars = c("sigma", "(Intercept)"),
##D              np = np, np_style = div_style)
##D 
##D # split the draws according to above/below median accept_stat__
##D # and show approximate location of divergences (red points)
##D color_scheme_set("brightblue")
##D mcmc_pairs(
##D   posterior,
##D   pars = c("wt", "cyl", "sigma"),
##D   off_diag_args = list(size = 1, alpha = 1/3),
##D   condition = pairs_condition(nuts = "accept_stat__"),
##D   np = np
##D )
##D 
##D # more customizations:
##D # - transform sigma to log(sigma)
##D # - median log-posterior as 'condition'
##D # - hex instead of scatter for off-diagonal plots
##D # - show points where max treedepth hit in blue
##D color_scheme_set("darkgray")
##D mcmc_pairs(
##D   posterior,
##D   pars = c("wt", "cyl", "sigma"),
##D   transform = list(sigma = "log"),
##D   off_diag_fun = "hex",
##D   condition = pairs_condition(nuts = "lp__"),
##D   lp = log_posterior(fit),
##D   np = np,
##D   np_style = pairs_style_np(div_color = "firebrick",
##D                             td_color = "blue",
##D                             td_size = 2),
##D   # for demonstration purposes, set max_treedepth to a value that will
##D   # result in at least a few max treedepth warnings
##D   max_treedepth = with(np, -1 + max(Value[Parameter == "treedepth__"]))
##D )
## End(Not run)




