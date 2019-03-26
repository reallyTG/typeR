library(rstanarm)


### Name: launch_shinystan.stanreg
### Title: Using the ShinyStan GUI with rstanarm models
### Aliases: launch_shinystan.stanreg launch_shinystan

### ** Examples

## Not run: 
##D if (!exists("example_model")) example(example_model) 
##D 
##D # Launch the ShinyStan app without saving the resulting shinystan object
##D if (interactive()) launch_shinystan(example_model)
##D 
##D # Launch the ShinyStan app (saving resulting shinystan object as sso)
##D if (interactive()) sso <- launch_shinystan(example_model)
##D 
##D # First create shinystan object then call launch_shinystan
##D sso <- shinystan::as.shinystan(example_model)
##D if (interactive()) launch_shinystan(sso)
##D 
##D # Prevent ShinyStan from preparing graphical posterior predictive checks that
##D # can be time consuming. example_model is small enough that it won't matter
##D # much here but in general this can help speed up launch_shinystan
##D sso <- shinystan::as.shinystan(example_model, ppd = FALSE)
##D if (interactive()) launch_shinystan(sso)
## End(Not run)




