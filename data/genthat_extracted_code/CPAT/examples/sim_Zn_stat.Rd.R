library(CPAT)


### Name: sim_Zn_stat
### Title: Rènyi-Type Statistic Simulation
### Aliases: sim_Zn_stat

### ** Examples

CPAT:::sim_Zn_stat(100)
CPAT:::sim_Zn_stat(100, kn = function(n) {floor(log(n))},
            use_kernel_var = TRUE, gen_func = CPAT:::rchangepoint,
            args = list(changepoint = 250, mean2 = 1))



