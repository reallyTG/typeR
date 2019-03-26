library(MCI)


### Name: ijmatrix.crosstab
### Title: Converting interaction matrix with market shares to crosstable
### Aliases: ijmatrix.crosstab

### ** Examples

data(grocery2)
# Loads the data

grocery2_cross <- ijmatrix.crosstab(grocery2, "plz_submarket", "store_code", "p_ij_obs")
# Converts the market shares in the grocery2 dataset to a crosstable



