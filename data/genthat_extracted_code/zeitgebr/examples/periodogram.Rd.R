library(zeitgebr)


### Name: periodogram
### Title: Computes periodograms
### Aliases: periodogram

### ** Examples

data(dams_sample)
# only a half of the individuals for the sake of the example
dt <- dams_sample[xmv(region_id) %in% (1:16 * 2)]
pdt <- periodogram(activity, dt, FUN = ls_periodogram, oversampling = 4)
pdt <- periodogram(activity, dt, FUN = chi_sq_periodogram)
## No test: 
require(ggetho)
ggperio(pdt, aes(colour=period_group)) + stat_pop_etho()
## End(No test)




