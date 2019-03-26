library(bayesdfa)


### Name: plot_trends
### Title: Plot the trends from a DFA
### Aliases: plot_trends

### ** Examples

set.seed(1)
s <- sim_dfa(num_trends = 1)
m <- fit_dfa(y = s$y_sim, num_trends = 1, iter = 500, chains = 1)
r <- rotate_trends(m)
p <- plot_trends(r)
print(p)



