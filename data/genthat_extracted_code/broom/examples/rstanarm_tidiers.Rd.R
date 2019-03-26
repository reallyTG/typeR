library(broom)


### Name: rstanarm_tidiers
### Title: Tidying methods for an rstanarm model
### Aliases: rstanarm_tidiers tidy.stanreg glance.stanreg

### ** Examples


## Not run: 
##D fit <- stan_glmer(mpg ~ wt + (1|cyl) + (1+wt|gear), data = mtcars,
##D                   iter = 300, chains = 2)
##D # non-varying ("population") parameters
##D tidy(fit, intervals = TRUE, prob = 0.5)
##D 
##D # hierarchical sd & correlation parameters
##D tidy(fit, parameters = "hierarchical")
##D 
##D # group-specific deviations from "population" parameters
##D tidy(fit, parameters = "varying")
##D 
##D # glance method
##D glance(fit)
##D glance(fit, looic = TRUE, cores = 1)
## End(Not run)




