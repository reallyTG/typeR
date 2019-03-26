library(descriptr)


### Name: dist_norm_plot
### Title: Visualize normal distribution
### Aliases: dist_norm_plot norm_plot dist_norm_perc norm_per
###   dist_norm_prob norm_prob

### ** Examples

# visualize normal distribution
dist_norm_plot()
dist_norm_plot(mean = 2, sd = 0.6)

# visualize probability from a given quantile
dist_norm_prob(3.78, mean = 2, sd = 1.36)
dist_norm_prob(3.43, mean = 2, sd = 1.36, type = 'upper')
dist_norm_prob(c(-1.74, 1.83), type = 'both')

# visualize quantiles out of given probability
dist_norm_perc(0.95, mean = 2, sd = 1.36)
dist_norm_perc(0.3, mean = 2, sd = 1.36, type = 'upper')
dist_norm_perc(0.95, mean = 2, sd = 1.36, type = 'both')




