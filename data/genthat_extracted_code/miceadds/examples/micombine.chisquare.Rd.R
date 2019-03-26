library(miceadds)


### Name: micombine.chisquare
### Title: Combination of Chi Square Statistics of Multiply Imputed
###   Datasets
### Aliases: micombine.chisquare
### Keywords: Chi square statistic D2 statistic

### ** Examples

#############################################################################
# EXAMPLE 1: Chi square values of analyses from 7 multiply imputed datasets
#############################################################################

# Vector of 7 chi square statistics
dk <- c(24.957, 18.051, 18.812, 17.362, 21.234, 18.615, 19.84)
dk.comb <- miceadds::micombine.chisquare(dk=dk, df=4 )
  ##  Combination of Chi Square Statistics for Multiply Imputed Data
  ##  Using 7 Imputed Data Sets
  ##  F(4, 482.06)=4.438     p=0.00157



