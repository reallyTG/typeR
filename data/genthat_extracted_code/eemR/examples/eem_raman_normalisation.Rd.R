library(eemR)


### Name: eem_raman_normalisation
### Title: Fluorescence Intensity Calibration Using the Raman Scatter Peak
###   of Water
### Aliases: eem_raman_normalisation

### ** Examples

# Open the fluorescence eem
file <- system.file("extdata/cary/scans_day_1", "sample1.csv", package = "eemR")
eem <- eem_read(file)

plot(eem)

# Open the blank eem
file <- system.file("extdata/cary/scans_day_1", "nano.csv", package = "eemR")
blank <- eem_read(file)

# Do the normalisation
eem <- eem_raman_normalisation(eem, blank)

plot(eem)



