library(mosaic)


### Name: compareProportion
### Title: Compare proportions between 2 groups
### Aliases: compareProportion
### Keywords: iteration stats

### ** Examples

if (require(mosaicData)) {
  data(HELPrct)
  # calculate the observed difference
  mean(homeless=="housed" ~ sex, data=HELPrct)
  obs <- diffprop(homeless=="housed" ~ sex, data=HELPrct); obs
  # calculate the permutation distribution
  nulldist <- do(100) * diffprop(homeless=="housed" ~ shuffle(sex), data=HELPrct)
  histogram(~ diffprop, groups=(diffprop>= obs), nulldist, 
    xlab="difference in proportions")
}



