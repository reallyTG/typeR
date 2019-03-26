library(eemR)


### Name: eem_fluorescence_index
### Title: Calculate the fluorescence index (FI)
### Aliases: eem_fluorescence_index

### ** Examples

file <- system.file("extdata/cary/scans_day_1/", "sample1.csv", package = "eemR")
eem <- eem_read(file)

eem_fluorescence_index(eem)



