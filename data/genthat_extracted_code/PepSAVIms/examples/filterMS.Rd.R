library(PepSAVIms)


### Name: filterMS
### Title: Filter compounds from mass spectrometry data
### Aliases: filterMS

### ** Examples


# Load mass spectrometry data
data(mass_spec)

# Convert mass_spec from a data.frame to an msDat object
ms <- msDat(mass_spec = mass_spec,
            mtoz = "m/z",
            charge = "Charge",
            ms_inten = c(paste0("_", 11:43), "_47"))

# Filter out potential candidate compounds
filter_out <- filterMS(msObj = ms,
                       region = paste0("VO_", 17:25),
                       border = "all",
                       bord_ratio = 0.01,
                       min_inten = 1000,
                       max_chg = 7)

# print, summary function
filter_out
summary(filter_out)

# Extract filtered mass spectrometry data as a matrix or msDat object
filter_matr <- extractMS(msObj = filter_out, type = "matrix")
filter_msDat <- extractMS(msObj = filter_out, type = "matrix")




