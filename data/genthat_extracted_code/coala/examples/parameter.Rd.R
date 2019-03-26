library(coala)


### Name: parameter
### Title: Model Parameters
### Aliases: parameter par_expr par_const par_named par_range par_prior

### ** Examples

# A parameter (here for the mutation rate) that is always
# equal to '5':
model_base <- coal_model(20, 1) +
  sumstat_nucleotide_div()

model <- model_base +
  feat_mutation(par_const(5))
simulate(model)

# With using a prior:
model <- model_base +
  feat_mutation(par_prior("theta", rnorm(1, 5, .1)))
simulate(model)

# Using a named parater:
model <- model_base +
  feat_mutation(par_named("theta"))
simulate(model, pars = c(theta = 5))

# or similarly a ranged parameter:
model <- model_base +
  feat_mutation(par_range("theta", 1, 10))
simulate(model, pars = c(theta = 5))

# Expressions can be used to derive parameters from
# other parameters:
model <- model_base +
  par_named("theta_half") +
  feat_mutation(par_expr(theta_half * 2))
simulate(model, pars = c(theta_half = 2.5))

model <- model_base +
  par_named("theta_log") +
  feat_mutation(par_expr(exp(theta_log)))
simulate(model, pars = c(theta_log = log(5)))



