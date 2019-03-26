library(MCI)


### Name: ijmatrix.shares
### Title: Market shares in interaction matrix
### Aliases: ijmatrix.shares

### ** Examples

data(grocery1)
# Loads the data

mymcidata <- ijmatrix.create (grocery1, "plz_submarket", "store_code")
# Creates an interaction matrix with market shares based on the frequencies 
# of visited grocery stores and saves results directly in a new dataset
mymcidata$freq_ij_corr <- var.correct(mymcidata$freq_ij_abs, 1)
# Corrects the frequency variable (no zero or negative values allowed)
mymcidata_shares <- ijmatrix.shares(mymcidata, "plz_submarket", "store_code", "freq_ij_corr")
# Calculates market shares based on the corrected frequencies
# and saves the results as a new dataset



