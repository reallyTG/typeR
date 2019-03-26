library(bayesplot)


### Name: PPC-intervals
### Title: PPC intervals
### Aliases: PPC-intervals ppc_intervals ppc_intervals_grouped ppc_ribbon
###   ppc_ribbon_grouped ppc_intervals_data ppc_ribbon_data

### ** Examples

y <- rnorm(50)
yrep <- matrix(rnorm(5000, 0, 2), ncol = 50)

color_scheme_set("brightblue")
ppc_ribbon(y, yrep)
ppc_intervals(y, yrep)

# change x axis to y values (instead of indices) and add x = y line
ppc_intervals(y, yrep, x = y) + abline_01()


color_scheme_set("teal")
year <- 1950:1999
ppc_ribbon(y, yrep, x = year, alpha = 0, size = 0.75) + ggplot2::xlab("Year")

color_scheme_set("pink")
year <- rep(2000:2009, each = 5)
group <- gl(5, 1, length = 50, labels = LETTERS[1:5])
ppc_ribbon_grouped(y, yrep, x = year, group) +
  ggplot2::scale_x_continuous(breaks = pretty)

ppc_ribbon_grouped(
 y, yrep, x = year, group,
 facet_args = list(scales = "fixed"),
 alpha = 1,
 size = 2
) +
 xaxis_text(FALSE) +
 xaxis_ticks(FALSE) +
 panel_bg(fill = "gray20")

ppc_dat <- ppc_intervals_data(y, yrep, x = year, prob = 0.5)
ppc_group_dat <- ppc_intervals_data(y, yrep, x = year, group = group, prob = 0.5)

## Not run: 
##D library("rstanarm")
##D fit <- stan_glmer(mpg ~ wt + (1|cyl), data = mtcars)
##D yrep <- posterior_predict(fit)
##D 
##D color_scheme_set("purple")
##D with(mtcars, ppc_intervals(mpg, yrep, x = wt, prob = 0.5)) +
##D  panel_bg(fill="gray90", color = NA) +
##D  grid_lines(color = "white")
##D 
##D ppc_intervals_grouped(y = mtcars$mpg, yrep, prob = 0.8,
##D                       x = mtcars$wt, group = mtcars$cyl)
##D 
##D 
##D color_scheme_set("gray")
##D ppc_intervals(mtcars$mpg, yrep, prob = 0.5) +
##D  ggplot2::scale_x_continuous(
##D    labels = rownames(mtcars),
##D    breaks = 1:nrow(mtcars)
##D  ) +
##D  xaxis_text(angle = -70, vjust = 1, hjust = 0)
##D 
## End(Not run)





