library(GCalignR)


### Name: merge_redundant_rows
### Title: Merge redundant rows
### Aliases: merge_redundant_rows

### ** Examples

## Load example dataset
data("peak_data")
## Subset for faster processing
peak_data <- peak_data[1:3]
peak_data <- lapply(peak_data, function(x) x[1:50,])
## align data whith strict parameters
out <- align_chromatograms(peak_data, rt_col_name = "time",
max_diff_peak2mean = 0.01, min_diff_peak2peak = 0.02)
## relax threshold to merge redundant rows
out2 <- merge_redundant_rows(data = out, min_diff_peak2peak = 0.05)




