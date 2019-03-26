library(ggstatsplot)


### Name: t1way_ci
### Title: #' @title A heteroscedastic one-way ANOVA for trimmed means with
###   confidence interval for effect size.
### Aliases: t1way_ci
### Keywords: internal

### ** Examples

## Not run: 
##D set.seed(123)
##D ggstatsplot:::t1way_ci(
##D   data = dplyr::filter(ggplot2::msleep, vore != "insecti"),
##D   x = vore,
##D   y = brainwt,
##D   tr = 0.05,
##D   nboot = 50,
##D   conf.level = 0.99,
##D   conf.type = "perc"
##D )
## End(Not run)




