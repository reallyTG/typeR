library(CPAT)


### Name: sim_Vn
### Title: CUSUM Statistic Simulation (Assuming Variance)
### Aliases: sim_Vn

### ** Examples

CPAT:::sim_Vn(100)
CPAT:::sim_Vn(100, gen_func = CPAT:::rchangepoint,
              args = list(changepoint = 250, mean2 = 1))



