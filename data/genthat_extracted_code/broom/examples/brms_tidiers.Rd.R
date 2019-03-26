library(broom)


### Name: brms_tidiers
### Title: Tidying methods for a brms model
### Aliases: brms_tidiers tidy.brmsfit

### ** Examples

## Not run: 
##D  library(brms)
##D  fit <- brm(mpg ~ wt + (1|cyl) + (1+wt|gear), data = mtcars,
##D             iter = 500, chains = 2)
##D  tidy(fit)
##D  tidy(fit, parameters = "^sd_", intervals = FALSE)
##D  tidy(fit, par_type = "non-varying")
##D  tidy(fit, par_type = "varying")
##D  tidy(fit, par_type = "hierarchical", robust = TRUE)
## End(Not run)




