library(bayesdfa)


### Name: loo.bayesdfa
### Title: LOO information criteria
### Aliases: loo.bayesdfa loo

### ** Examples

## No test: 
set.seed(1)
s <- sim_dfa(num_trends = 1, num_years = 50, num_ts = 3)
m <- fit_dfa(y = s$y_sim, iter = 300, chains = 1, num_trends = 1)
loo(m)
## End(No test)



