library(bayesdfa)


### Name: find_inverted_chains
### Title: Find which chains to invert
### Aliases: find_inverted_chains

### ** Examples

set.seed(2)
s <- sim_dfa(num_trends = 2)
set.seed(1)
m <- fit_dfa(y = s$y_sim, num_trends = 1, iter = 500, chains = 2)
# chains were already inverted, but we can redo that, as an example, with:
find_inverted_chains(m$model, plot = TRUE)



