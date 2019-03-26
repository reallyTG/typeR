library(eemR)


### Name: eem_cut
### Title: Cut emission and/or excitation wavelengths from EEMs
### Aliases: eem_cut

### ** Examples

# Open the fluorescence eem
file <- system.file("extdata/cary/scans_day_1/", "sample1.csv", package = "eemR")

eem <- eem_read(file)
plot(eem)

# Cut few excitation wavelengths
eem <- eem_cut(eem, ex = c(220, 225, 230, 230))
plot(eem)

eem <- eem_read(file)
eem <- eem_cut(eem, em = 350:400, fill_with_na = TRUE)
plot(eem)



