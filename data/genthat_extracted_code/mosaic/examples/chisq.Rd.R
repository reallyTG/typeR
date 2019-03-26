library(mosaic)


### Name: chisq
### Title: Extract Chi-squared statistic
### Aliases: chisq chisq.htest chisq.table chisq.default

### ** Examples


if(require(mosaicData)) {
  Mites.table <- tally( ~ outcome + treatment, data=Mites )
  Mites.table 
  chisq.test(Mites.table)
  chisq(Mites.table)
  chisq(chisq.test(Mites.table))
  ## Randomization test.  Increase replications to decrease Monte Carlo error.
  do(3) * chisq( tally( ~ outcome + shuffle(treatment),  data=Mites ) )
  Mites.rand <- do(1000) * chisq( tally( ~ outcome + shuffle(treatment),  data=Mites ) )
  tally( ~(X.squared >= chisq(Mites.table)), data=Mites.rand, format="proportion")
}
  



