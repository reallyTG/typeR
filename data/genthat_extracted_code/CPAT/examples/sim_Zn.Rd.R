library(CPAT)


### Name: sim_Zn
### Title: Rènyi-Type Statistic Simulation (Assuming Variance)
### Aliases: sim_Zn

### ** Examples

CPAT:::sim_Zn(100, kn = function(n) {floor(log(n))})
CPAT:::sim_Zn(100, kn = function(n) {floor(log(n))},
              gen_func = CPAT:::rchangepoint, args = list(changepoint = 250,
                                                          mean2 = 1))



