library(bayesdfa)


### Name: find_dfa_trends
### Title: Find the best number of trends according to LOOIC
### Aliases: find_dfa_trends

### ** Examples

## No test: 
set.seed(42)
s <- sim_dfa(num_trends = 2, num_years = 20, num_ts = 3)
# only 1 chain and 180 iterations used so example runs quickly:
m <- find_dfa_trends(
  y = s$y_sim, iter = 180,
  kmin = 1, kmax = 2, chains = 1, compare_normal = FALSE,
  variance = "equal", convergence_threshold = 1.1,
  control = list(adapt_delta = 0.95, max_treedepth = 20))
m$summary
m$best_model
## End(No test)



