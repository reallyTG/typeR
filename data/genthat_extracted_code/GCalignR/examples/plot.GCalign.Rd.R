library(GCalignR)


### Name: plot.GCalign
### Title: Plot diagnostics for an GCalign Object
### Aliases: plot.GCalign

### ** Examples

## GCalign object
data("aligned_peak_data")

## All plots are shown by default
plot(aligned_peak_data)

## Distribution of peak numbers
plot(aligned_peak_data, which_plot = "peak_numbers")

## variation of retention times
plot(aligned_peak_data, which_plot = "variation")




