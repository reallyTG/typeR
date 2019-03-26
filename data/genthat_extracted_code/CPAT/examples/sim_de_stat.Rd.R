library(CPAT)


### Name: sim_de_stat
### Title: Darling-Erdös Statistic Simulation
### Aliases: sim_de_stat

### ** Examples

CPAT:::sim_de_stat(100)
CPAT:::sim_de_stat(100, use_kernel_var = TRUE,
                   gen_func = CPAT:::rchangepoint,
                   args = list(changepoint = 250, mean2 = 1))



