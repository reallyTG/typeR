library(bayesdfa)


### Name: predicted
### Title: Calculate predicted value from DFA object
### Aliases: predicted

### ** Examples

set.seed(42)
s <- sim_dfa(num_trends = 1, num_years = 20, num_ts = 3)
# only 1 chain and 1000 iterations used so example runs quickly:
m <- fit_dfa(y = s$y_sim, iter = 1000, chains = 1)
pred <- predicted(m)




