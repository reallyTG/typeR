library(saeSim)


### Name: sim_gen
### Title: Generation component
### Aliases: sim_gen sim_gen_generic

### ** Examples

# Data setup for a mixed model
sim_base() %>% sim_gen_x() %>% sim_gen_v() %>% sim_gen_e()
# Adding contamination in the model error
sim_base() %>% sim_gen_x() %>% sim_gen_v() %>% sim_gen_e() %>% sim_gen_ec()

# Simple user defined generator:
gen_myVar <- function(dat) {
  dat["myVar"] <- rnorm(nrow(dat))
  dat
}

sim_base() %>% sim_gen_x() %>% sim_gen(gen_myVar)

# And a chi-sq(5) distributed 'random-effect':
sim_base() %>% sim_gen_generic(rchisq, df = 5, groupVars = "idD", name = "re")



