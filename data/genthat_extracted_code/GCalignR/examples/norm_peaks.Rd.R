library(GCalignR)


### Name: norm_peaks
### Title: Normalisation of peak abundancies
### Aliases: norm_peaks

### ** Examples

## aligned gc-dataset
data("aligned_peak_data")
## returns normalised peak area
norm_peaks(data = aligned_peak_data, conc_col_name = "area", rt_col_name = "time")




