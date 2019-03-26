library(ggstatsplot)


### Name: yuend_ci
### Title: Paired samples robust _t_-tests with confidence interval for
###   effect size.
### Aliases: yuend_ci
### Keywords: internal

### ** Examples

## Not run: 
##D ggstatsplot:::yuend_ci(
##D   data = dplyr::filter(
##D     .data = ggstatsplot::iris_long,
##D     condition %in% c("Sepal.Length", "Petal.Length")
##D   ),
##D   x = condition,
##D   y = value,
##D   nboot = 50,
##D   tr = 0.2
##D )
## End(Not run)




