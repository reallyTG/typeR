library(saeSim)


### Name: sim_gen_cont
### Title: Generation Component for contamination
### Aliases: sim_gen_cont

### ** Examples

sim_base_lm() %>% 
  sim_gen_cont(gen_norm(name = "e"), nCont = 0.05, type = "unit", areaVar = "idD") %>%
  as.data.frame



