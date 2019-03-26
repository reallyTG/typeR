library(eemR)


### Name: eem_biological_index
### Title: Calculate the biological fluorescence index (BIX)
### Aliases: eem_biological_index

### ** Examples

file <- system.file("extdata/cary/scans_day_1/", package = "eemR")
eem <- eem_read(file)

eem_biological_index(eem)




