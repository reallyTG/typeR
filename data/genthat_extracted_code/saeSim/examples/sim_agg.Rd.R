library(saeSim)


### Name: sim_agg
### Title: Aggregation component
### Aliases: sim_agg

### ** Examples

# Aggregating the population:
sim_base_lm() %>% sim_agg()

# Aggregating after sampling:
sim_base_lm() %>% sim_sample() %>% sim_agg()

# User aggFun:
sim_base_lm() %>% sim_agg(function(dat) dat[1, ])



