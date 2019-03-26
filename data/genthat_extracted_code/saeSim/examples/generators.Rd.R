library(saeSim)


### Name: gen_norm
### Title: Generator functions
### Aliases: gen_norm gen_v_norm gen_v_sar gen_v_ar1 gen_generic

### ** Examples

sim_base() %>% sim_gen_x() %>% sim_gen_e() %>% sim_gen_v() %>% sim_gen(gen_v_sar(name = "vSP"))

# Generic interface
set.seed(1)
dat1 <- sim(base_id() %>%
  sim_gen(gen_generic(rnorm, mean = 0, sd = 4, name = "e")))
set.seed(1)
dat2 <- sim(base_id() %>% sim_gen_e())
all.equal(dat1, dat2)



