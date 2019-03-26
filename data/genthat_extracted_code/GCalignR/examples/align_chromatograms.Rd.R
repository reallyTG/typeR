library(GCalignR)


### Name: align_chromatograms
### Title: Aligning peaks based on retention times
### Aliases: align_chromatograms

### ** Examples

## Load example dataset
data("peak_data")
## Subset for faster processing
peak_data <- peak_data[1:3]
peak_data <- lapply(peak_data, function(x) x[1:50,])
## align data with default settings
out <- align_chromatograms(peak_data, rt_col_name = "time")




