library(broom.mixed)


### Name: brms_tidiers
### Title: Tidying methods for a brms model
### Aliases: brms_tidiers tidy.brmsfit glance.brmsfit augment.brmsfit

### ** Examples

 ## original model
 ## Not run: 
##D     brms_crossedRE <- brm(mpg ~ wt + (1|cyl) + (1+wt|gear), data = mtcars,
##D            iter = 500, chains = 2)
##D  
## End(Not run)
 if (require("brms")) {
   ## load stored object
   load(system.file("extdata", "brms_example.rda", package="broom.mixed"))

   fit <- brms_crossedRE
   tidy(fit)
   tidy(fit, parameters = "^sd_", conf.int = FALSE)
   tidy(fit, effects = "fixed", conf.method="HPDinterval")
   tidy(fit, effects = "ran_vals")
   tidy(fit, effects = "ran_pars", robust = TRUE)
   # glance method
   glance(fit)
   ## this example will give a warning that it should be run with
   ## reloo=TRUE; however, doing this will fail
   ## because the \code{fit} object has been stripped down to save space
   suppressWarnings(glance(fit, looic = TRUE, cores = 1))
   head(augment(fit))
}




