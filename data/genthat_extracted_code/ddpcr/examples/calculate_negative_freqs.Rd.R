library(ddpcr)


### Name: calculate_negative_freqs
### Title: Calculate negative frequencies in whole plate
### Aliases: calculate_negative_freqs
### Keywords: internal

### ** Examples

file <- system.file("sample_data", "small", "analyzed_pnpp.rds", package = "ddpcr")
plate <- load_plate(file)
plate %>% calculate_negative_freqs %>%
  well_info(wells_success(plate), "negative_freq")



