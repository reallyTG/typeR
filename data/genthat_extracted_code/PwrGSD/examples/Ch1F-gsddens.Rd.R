library(PwrGSD)


### Name: gsd.dens
### Title: A function for computing the probability density for the group
###   sequentially monitored test statistic.
### Aliases: gsd.dens
### Keywords: Stage-wise P-value sequential statistic pdf

### ** Examples

  # Information fraction
  frac <- c(0.15, 0.37, 0.64, 0.76)

  # Efficacy Boundary 
  gsb <- GrpSeqBnds(frac=frac, EfficacyBoundary=LanDemets(spending=ObrienFleming, alpha=0.05))

  # To compute the p-value under the stagewise ordering, for an observed
  #  value of the monitoring statistic 2.1, crossing the efficacy
  #  boundary at the 4th analysis, we do the following

  be <- gsb$table[,"b.e"] 
  be[4] <- 2.1

  sum(gsd.dens(be, frac, scale="Standard")$dF)




