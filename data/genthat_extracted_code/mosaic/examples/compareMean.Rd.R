library(mosaic)


### Name: compareMean
### Title: Compare means between 2 groups
### Aliases: compareMean
### Keywords: iteration stats

### ** Examples

if (require(mosaicData)) {
  data(HELPrct)
  # calculate the observed difference
  mean(age ~ sex, data=HELPrct)
  obs <- diffmean(age ~ sex, data=HELPrct); obs
  # calculate the permutation distribution
  nulldist <- do(100) * diffmean(age ~ shuffle(sex), 
    data=HELPrct) 
  histogram(~ diffmean, groups=(diffmean >= obs), nulldist, 
    xlab="difference in means")
}



