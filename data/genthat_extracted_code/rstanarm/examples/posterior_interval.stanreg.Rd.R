library(rstanarm)


### Name: posterior_interval.stanreg
### Title: Posterior uncertainty intervals
### Aliases: posterior_interval.stanreg posterior_interval

### ** Examples

if (!exists("example_model")) example(example_model)
posterior_interval(example_model)
posterior_interval(example_model, regex_pars = "herd")
posterior_interval(example_model, pars = "period2", prob = 0.5)




