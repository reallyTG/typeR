library(eemR)


### Name: eem_remove_scattering
### Title: Remove Raman and Rayleigh scattering
### Aliases: eem_remove_scattering

### ** Examples

# Open the fluorescence eem
file <- system.file("extdata/cary/scans_day_1", "sample1.csv", package = "eemR")
eem <- eem_read(file)

plot(eem)

# Remove the scattering
eem <- eem_remove_scattering(eem = eem, type = "raman", order = 1, width = 10)
eem <- eem_remove_scattering(eem = eem, type = "rayleigh", order = 1, width = 10)

plot(eem)



