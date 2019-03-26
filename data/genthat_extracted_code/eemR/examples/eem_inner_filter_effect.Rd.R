library(eemR)


### Name: eem_inner_filter_effect
### Title: Inner-filter effect correction
### Aliases: eem_inner_filter_effect

### ** Examples

library(eemR)
data("absorbance")

folder <- system.file("extdata/cary/scans_day_1", package = "eemR")
eems <- eem_read(folder)
eems <- eem_extract(eems, "nano") # Remove the blank sample

# Remove scattering (1st order)
eems <- eem_remove_scattering(eems, "rayleigh")

eems_corrected <- eem_inner_filter_effect(eems, absorbance = absorbance, pathlength = 1)

op <- par(mfrow = c(2, 1))
plot(eems, which = 1)
plot(eems_corrected, which = 1)
par(op)




