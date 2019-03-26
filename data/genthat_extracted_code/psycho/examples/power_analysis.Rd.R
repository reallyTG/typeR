library(psycho)


### Name: power_analysis
### Title: Power analysis for fitted models.
### Aliases: power_analysis

### ** Examples

## Not run: 
##D library(dplyr)
##D library(psycho)
##D 
##D fit <- lm(Sepal.Length ~ Sepal.Width, data = iris)
##D 
##D results <- power_analysis(fit, n_max = 300, n_min = 100, step = 5, n_batch = 20)
##D 
##D results %>%
##D   filter(Variable == "Sepal.Width") %>%
##D   select(n, p) %>%
##D   group_by(n) %>%
##D   summarise(
##D     p_median = median(p),
##D     p_mad = mad(p)
##D   )
## End(Not run)




