library(bayesdfa)


### Name: fit_dfa
### Title: Fit a Bayesian DFA
### Aliases: fit_dfa

### ** Examples

set.seed(42)
s <- sim_dfa(num_trends = 1, num_years = 20, num_ts = 3)
# only 1 chain and 250 iterations used so example runs quickly:
m <- fit_dfa(y = s$y_sim, iter = 250, chains = 1)



