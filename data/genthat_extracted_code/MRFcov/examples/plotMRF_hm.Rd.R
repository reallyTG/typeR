library(MRFcov)


### Name: plotMRF_hm
### Title: Plot MRF interaction parameters as a heatmap
### Aliases: plotMRF_hm

### ** Examples


data("Bird.parasites")
CRFmod <- MRFcov(data = Bird.parasites, n_nodes = 4, family = 'binomial')
plotMRF_hm(MRF_mod = CRFmod)
plotMRF_hm(MRF_mod = CRFmod, plot_observed_vals = TRUE, data = Bird.parasites)




