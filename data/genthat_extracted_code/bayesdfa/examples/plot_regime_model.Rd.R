library(bayesdfa)


### Name: plot_regime_model
### Title: Plot the state probabilities from 'find_regimes()'
### Aliases: plot_regime_model

### ** Examples

data(Nile)
m <- fit_regimes(log(Nile), n_regimes = 2, chains = 1, iter = 800)
plot_regime_model(m)
plot_regime_model(m, plot_prob_indices=c(2))
plot_regime_model(m, type = "means")



