library(vistributions)


### Name: vdist_binom_plot
### Title: Visualize binomial distribution
### Aliases: vdist_binom_plot vdist_binom_prob vdist_binom_perc

### ** Examples

# visualize binomial distribution
vdist_binom_plot(10, 0.3)

# visualize probability from a given quantile
vdist_binom_prob(10, 0.3, 4, type = 'exact')
vdist_binom_prob(10, 0.3, 4, type = 'lower')
vdist_binom_prob(10, 0.3, 4, type = 'upper')
vdist_binom_prob(10, 0.3, c(4, 6), type = 'interval')


# visualize quantiles out of given probability
vdist_binom_perc(10, 0.5, 0.05)
vdist_binom_perc(10, 0.5, 0.05, "upper")




