library(eemR)


### Name: eem_humification_index
### Title: Calculate the fluorescence humification index (HIX)
### Aliases: eem_humification_index

### ** Examples

file <- system.file("extdata/cary/scans_day_1/", package = "eemR")
eem <- eem_read(file)

eem_humification_index(eem)




