library(CPAT)


### Name: sim_Vn_stat
### Title: CUSUM Statistic Simulation
### Aliases: sim_Vn_stat

### ** Examples

CPAT:::sim_Vn_stat(100)
CPAT:::sim_Vn_stat(100, kn = function(n) {floor(0.1 * n)}, tau = 1/3,
                   use_kernel_var = TRUE, gen_func = CPAT:::rchangepoint,
                   args = list(changepoint = 250, mean2 = 1))



