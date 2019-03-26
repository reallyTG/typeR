library(tidyLPA)


### Name: plot_profiles_mplus
### Title: Plot variable means and their confidence intervals by profile
###   for models estimated with MPlus (requires purchasing and installing
###   MPlus to use)
### Aliases: plot_profiles_mplus

### ** Examples

## Not run: 
##D 
##D m <- estimate_profiles_mplus(iris,
##D Sepal.Length, Sepal.Width, Petal.Length, Petal.Width,
##D n_profiles = 2)
##D 
##D plot_profiles_mplus(m)
##D 
##D m <- estimate_profiles_mplus(iris,
##D Sepal.Length, Sepal.Width, Petal.Length, Petal.Width,
##D n_profiles = 2, latent_vars = list(sepal = c(1, 2), petal = c(3, 4)),
##D remove_tmp_files = FALSE)
##D 
##D plot_profiles_mplus(mplus_out_name = "i.out")
## End(Not run)



