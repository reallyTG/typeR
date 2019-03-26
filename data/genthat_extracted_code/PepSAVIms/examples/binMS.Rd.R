library(PepSAVIms)


### Name: binMS
### Title: Consolidate mass spectrometry observations
### Aliases: binMS

### ** Examples


# Load mass spectrometry data
data(mass_spec)

# Perform consolidation via binMS
bin_out <- binMS(mass_spec = mass_spec,
                 mtoz = "m/z",
                 charge = "Charge",
                 mass = "Mass",
                 time_peak_reten = "Reten",
                 ms_inten = NULL,
                 time_range = c(14, 45),
                 mass_range = c(2000, 15000),
                 charge_range = c(2, 10),
                 mtoz_diff = 0.05,
                 time_diff = 60)

# print, summary function
bin_out
summary(bin_out)

# Extract consolidated mass spectrometry data as a matrix or msDat object
bin_matr <- extractMS(msObj = bin_out, type = "matrix")
bin_msDat <- extractMS(msObj = bin_out, type = "matrix")




