library(rstanarm)


### Name: summary.stanreg
### Title: Summary method for stanreg objects
### Aliases: summary.stanreg print.summary.stanreg
###   as.data.frame.summary.stanreg summary.stanmvreg
###   print.summary.stanmvreg

### ** Examples

if (!exists("example_model")) example(example_model) 
summary(example_model, probs = c(0.1, 0.9))

# These produce the same output for this example, 
# but the second method can be used for any model
summary(example_model, pars = c("(Intercept)", "size", 
                                paste0("period", 2:4)))
summary(example_model, pars = c("alpha", "beta"))

# Only show parameters varying by group
summary(example_model, pars = "varying")
as.data.frame(summary(example_model, pars = "varying"))




