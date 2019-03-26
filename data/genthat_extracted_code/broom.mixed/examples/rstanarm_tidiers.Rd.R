library(broom.mixed)


### Name: rstanarm_tidiers
### Title: Tidying methods for an rstanarm model
### Aliases: rstanarm_tidiers tidy.stanreg glance.stanreg

### ** Examples


if (require("rstanarm")) {
## Not run: 
##D #'     ## original model
##D     fit <- stan_glmer(mpg ~ wt + (1|cyl) + (1+wt|gear), data = mtcars,
##D                       iter = 300, chains = 2)
##D   
## End(Not run)
## load example data
fit <- readRDS(system.file("extdata", "rstanarm_example.rds", package="broom.mixed"))

  # non-varying ("population") parameters
  tidy(fit, conf.int = TRUE, prob = 0.5)
  tidy(fit, conf.int = TRUE, conf.method = "HPDinterval", prob = 0.5)

  # hierarchical sd & correlation parameters
  tidy(fit, effects = "ran_pars")

  # group-specific deviations from "population" parameters
  tidy(fit, effects = "ran_vals")

  # glance method
   glance(fit)
  ## Not run: 
##D      glance(fit, looic = TRUE, cores = 1)
##D   
## End(Not run)
} ## if require("rstanarm")



