library(PepSAVIms)


### Name: rankEN
### Title: Rank compounds via the Elastic Net path
### Aliases: rankEN

### ** Examples


# Load mass spectrometry data
data(mass_spec)

# Convert mass_spec from a data.frame to an msDat object
ms <- msDat(mass_spec = mass_spec,
            mtoz = "m/z",
            charge = "Charge",
            ms_inten = c(paste0("_", 11:43), "_47"))

# Load growth inhibition bioactivity data.  Each element in bioact is a
# stand-alone dataset for a species of virus or bacteria.
data(bioact)

# Perform the candidate ranking procedure with fractions 21-24 as the region
# of interest.  Note that it is not advisable to calculate the elastic net
# estimates with 30,799 candidate compounds on 4 data points!

## Not run: 
##D 
##D     rank_out <- rankEN(msObj = ms,
##D                        bioact = bioact$ec,
##D                        region_ms = paste0("_", 21:24),
##D                        region_bio = paste0("_", 21:24),
##D                        lambda = 0.001,
##D                        pos_only = TRUE,
##D                        ncomp = NULL)
##D 
##D     # print, summary function
##D     rank_out
##D     summary(rank_out)
##D 
##D     # Extract ranked compounds as a data.frame
##D     ranked_candidates <- extract_ranked(rank_out)
##D 
## End(Not run)




