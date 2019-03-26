library(MCI)


### Name: grocery2
### Title: Grocery store market areas in Goettingen
### Aliases: grocery2

### ** Examples

data(grocery2)
# Loads the data
mci.transmat (grocery2, "plz_submarket", "store_code", "p_ij_obs", "dist_km", "salesarea_qm")
# Applies the log-centering transformation to the dataset using the function mci.transmat



