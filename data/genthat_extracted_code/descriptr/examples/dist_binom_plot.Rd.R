library(descriptr)


### Name: dist_binom_plot
### Title: Visualize binomial distribution
### Aliases: dist_binom_plot binom_plot dist_binom_prob binom_prob
###   dist_binom_perc binom_perc

### ** Examples

# visualize binomial distribution
dist_binom_plot(10, 0.3)

# visualize probability from a given quantile
dist_binom_prob(10, 0.3, 4, type = 'exact')
dist_binom_prob(10, 0.3, 4, type = 'lower')
dist_binom_prob(10, 0.3, 4, type = 'upper')
dist_binom_prob(10, 0.3, c(4, 6), type = 'interval')

# visualize quantiles out of given probability
dist_binom_perc(10, 0.5, 0.05)
dist_binom_perc(10, 0.5, 0.05, "upper")




