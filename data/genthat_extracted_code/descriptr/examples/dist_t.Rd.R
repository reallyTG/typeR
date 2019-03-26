library(descriptr)


### Name: dist_t
### Title: Visualize t distribution
### Aliases: dist_t dist_t_plot t_plot dist_t_perc t_per dist_t_prob t_prob

### ** Examples

# visualize t distribution
dist_t_plot()
dist_t_plot(6)
dist_t_plot(df = 8)

# visualize quantiles out of given probability
dist_t_perc(probs = 0.95, df = 4, type = 'lower')
dist_t_perc(probs = 0.35, df = 4, type = 'upper')
dist_t_perc(probs = 0.69, df = 7, type = 'both')

# visualize probability from a given quantile
dist_t_prob(2.045, 7, 'lower')
dist_t_prob(0.945, 7, 'upper')
dist_t_prob(1.445, 7, 'interval')
dist_t_prob(1.6, 7, 'both')




