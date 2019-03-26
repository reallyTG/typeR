library(tidyLPA)


### Name: plot_density
### Title: Create density plots for mixture models
### Aliases: plot_density
### Keywords: density mixture plot

### ** Examples

## Not run: 
##D results <- iris %>%
##D   subset(select = c("Sepal.Length", "Sepal.Width",
##D     "Petal.Length", "Petal.Width")) %>%
##D   estimate_profiles(1:3)
## End(Not run)
## Not run: 
##D plot_density(results, variables = "Petal.Length")
## End(Not run)
## Not run: 
##D plot_density(results, bw = TRUE)
## End(Not run)
## Not run: 
##D plot_density(results, bw = FALSE, conditional = TRUE)
## End(Not run)
## Not run: 
##D plot_density(results[[2]], variables = "Petal.Length")
## End(Not run)



