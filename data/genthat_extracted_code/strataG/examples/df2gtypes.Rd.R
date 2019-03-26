library(strataG)


### Name: df2gtypes
### Title: Convert a data.frame to gtypes
### Aliases: df2gtypes

### ** Examples

#--- create a diploid (microsatellite) gtypes object
data(dolph.msats)
ms.g <- df2gtypes(dolph.msats, ploidy = 2, strata.col = NULL, loc.col = 2)
ms.g

#' #--- create a haploid sequence (mtDNA) gtypes object
data(dolph.strata)
data(dolph.haps)

seq.df <- dolph.strata[ c("id", "broad", "dLoop")]
dl.g <- df2gtypes(seq.df, ploidy = 1, sequences = dolph.haps)
dl.g




