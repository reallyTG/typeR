library(miceadds)


### Name: micombine.F
### Title: Combination of F Statistics for Multiply Imputed Datasets Using
###   a Chi Square Approximation
### Aliases: micombine.F
### Keywords: F statistic

### ** Examples

#############################################################################
# EXAMPLE 1: F statistics for 5 imputed datasets
#############################################################################

Fvalues <- c( 6.76, 4.54, 4.23, 5.45, 4.78 )
micombine.F(Fvalues, df1=4 )
  ##  Combination of Chi Square Statistics for Multiply Imputed Data
  ##  Using 5 Imputed Data Sets
  ##  F(4, 52.94)=3.946     p=0.00709



