library(MCI)


### Name: mci.shares
### Title: MCI market share/market area simulations
### Aliases: mci.shares

### ** Examples

data(Freiburg1)
data(Freiburg2)
# Loads the data

mynewmatrix <- mci.shares(Freiburg1, "district", "store", "salesarea", 1, "distance", -2)
# Calculating shares based on two attractivity/utility variables

mynewmatrix_alldata <- merge(mynewmatrix, Freiburg2)
# Merge interaction matrix with district data (purchasing power)

shares.total (mynewmatrix_alldata, "district", "store", "p_ij", "ppower")
# Calculation of total sales 



