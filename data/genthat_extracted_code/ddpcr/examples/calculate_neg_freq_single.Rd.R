library(ddpcr)


### Name: calculate_neg_freq_single
### Title: Calculate negative frequency of a single well
### Aliases: calculate_neg_freq_single
### Keywords: internal

### ** Examples

file <- system.file("sample_data", "small", "analyzed_pnpp.rds", package = "ddpcr")
plate <- load_plate(file)
plate %>% calculate_neg_freq_single("A05")



