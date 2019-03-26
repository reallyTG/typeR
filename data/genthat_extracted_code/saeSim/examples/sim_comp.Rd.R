library(saeSim)


### Name: sim_comp_pop
### Title: Calculation component
### Aliases: sim_comp_pop sim_comp_sample sim_comp_agg

### ** Examples

# Standard behavior
sim_base() %>% sim_gen_x() %>% sim_comp_N()

# Custom data modifications
## Add predicted values of a linear model
library(saeSim)

comp_lm <- function(dat) {
  dat$linearPredictor <- predict(lm(y ~ x, data = dat))
  dat
}

sim_base_lm() %>% sim_comp_pop(comp_lm)

# or if applied after sampling
sim_base_lm() %>% sim_sample() %>% sim_comp_pop(comp_lm)



