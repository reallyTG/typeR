library(rstanarm)


### Name: prior_summary.stanreg
### Title: Summarize the priors used for an rstanarm model
### Aliases: prior_summary.stanreg prior_summary

### ** Examples

if (!exists("example_model")) example(example_model) 
prior_summary(example_model)

priors <- prior_summary(example_model)
names(priors)
priors$prior$scale
priors$prior$adjusted_scale

# for a glm with adjusted scales (see Details, above), compare 
# the default (rstanarm adjusting the scales) to setting 
# autoscale=FALSE for prior on coefficients
fit <- stan_glm(mpg ~ wt + am, data = mtcars, 
                prior = normal(0, c(2.5, 4)), 
                prior_intercept = normal(0, 5), 
                iter = 10, chains = 1) # only for demonstration 
prior_summary(fit)

fit2 <- update(fit, prior = normal(0, c(2.5, 4), autoscale=FALSE), 
               prior_intercept = normal(0, 5, autoscale=FALSE))
prior_summary(fit2)




