library(broom)


### Name: tidy.ergm
### Title: Tidy a(n) ergm object
### Aliases: tidy.ergm ergm_tidiers

### ** Examples


## Not run: 
##D if (require("ergm")) {
##D     # Using the same example as the ergm package
##D     # Load the Florentine marriage network data
##D     data(florentine)
##D 
##D     # Fit a model where the propensity to form ties between
##D     # families depends on the absolute difference in wealth
##D     gest <- ergm(flomarriage ~ edges + absdiff("wealth"))
##D 
##D     # Show terms, coefficient estimates and errors
##D     tidy(gest)
##D 
##D     # Show coefficients as odds ratios with a 99% CI
##D     tidy(gest, exponentiate = TRUE, conf.int = TRUE, conf.level = 0.99)
##D 
##D     # Take a look at likelihood measures and other
##D     # control parameters used during MCMC estimation
##D     glance(gest)
##D     glance(gest, deviance = TRUE)
##D     glance(gest, mcmc = TRUE)
##D }
## End(Not run)




