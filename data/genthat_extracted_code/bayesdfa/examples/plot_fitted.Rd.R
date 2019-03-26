library(bayesdfa)


### Name: plot_fitted
### Title: Plot the trends from a DFA
### Aliases: plot_fitted

### ** Examples

## No test: 
y <- sim_dfa(num_trends = 2, num_years = 20, num_ts = 4)
m <- fit_dfa(y = y, num_trends = 2, iter = 200, chains = 1)
p <- plot_fitted(m)
print(p)
## End(No test)



