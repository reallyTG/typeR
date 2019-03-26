library(rstanarm)


### Name: example_model
### Title: Example model
### Aliases: example_model

### ** Examples

example_model <- 
  stan_glmer(cbind(incidence, size - incidence) ~ size + period + (1|herd),
             data = lme4::cbpp, family = binomial, QR = TRUE,
             # this next line is only to keep the example small in size!
             chains = 2, cores = 1, seed = 12345, iter = 500, refresh = 0)
example_model



