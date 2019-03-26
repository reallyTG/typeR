library(bayesdfa)


### Name: rotate_trends
### Title: Rotate the trends from a DFA
### Aliases: rotate_trends

### ** Examples

set.seed(42)
s <- sim_dfa(num_trends = 1, num_years = 20, num_ts = 3)
# only 1 chain and 800 iterations used so example runs quickly:
m <- fit_dfa(y = s$y_sim, iter = 800, chains = 1)
r <- rotate_trends(m)
plot_trends(r)



