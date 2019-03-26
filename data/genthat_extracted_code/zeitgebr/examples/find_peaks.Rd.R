library(zeitgebr)


### Name: find_peaks
### Title: Find peaks in a periodogram
### Aliases: find_peaks

### ** Examples

data(dams_sample)
# only a half of the individuals for the sake of the example
dt <- dams_sample[xmv(region_id) %in% (1:16 * 2)]
per_dt_xs <- periodogram(activity, dt, FUN = chi_sq_periodogram)
per_dt_xs_with_peaks <- find_peaks(per_dt_xs)
per_dt_xs_with_peaks[peak == 1]



