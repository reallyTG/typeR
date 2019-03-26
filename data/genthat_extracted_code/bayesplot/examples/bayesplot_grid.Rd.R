library(bayesplot)


### Name: bayesplot_grid
### Title: Arrange plots in a grid
### Aliases: bayesplot_grid

### ** Examples

y <- example_y_data()
yrep <- example_yrep_draws()
stats <- c("sd", "median", "max", "min")

color_scheme_set("pink")
bayesplot_grid(
 plots = lapply(stats, function(s) ppc_stat(y, yrep, stat = s)),
 titles = stats,
 legends = FALSE,
 grid_args = list(ncol = 1)
)

## Not run: 
##D library(rstanarm)
##D mtcars$log_mpg <- log(mtcars$mpg)
##D fit1 <- stan_glm(mpg ~ wt, data = mtcars)
##D fit2 <- stan_glm(log_mpg ~ wt, data = mtcars)
##D 
##D y <- mtcars$mpg
##D yrep1 <- posterior_predict(fit1, draws = 50)
##D yrep2 <- posterior_predict(fit2, fun = exp, draws = 50)
##D 
##D color_scheme_set("blue")
##D ppc1 <- ppc_dens_overlay(y, yrep1)
##D ppc1
##D ppc1 + yaxis_text()
##D 
##D color_scheme_set("red")
##D ppc2 <- ppc_dens_overlay(y, yrep2)
##D bayesplot_grid(ppc1, ppc2)
##D 
##D # make sure the plots use the same limits for the axes
##D bayesplot_grid(ppc1, ppc2, xlim = c(-5, 60), ylim = c(0, 0.2))
##D 
##D # remove the legends and add text
##D bayesplot_grid(ppc1, ppc2, xlim = c(-5, 60), ylim = c(0, 0.2),
##D                legends = FALSE, subtitles = rep("Predicted MPG", 2))
## End(Not run)




