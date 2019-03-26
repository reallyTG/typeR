library(polySegratio)


### Name: test.segRatio
### Title: Classic tests for assessing marker dosage in autopolyploids
### Aliases: test.segRatio
### Keywords: manip

### ** Examples


  ## simulated data
  a <- sim.autoMarkers(ploidy = 8, c(0.7,0.2,0.09,0.01))
  print(a)

  ## summarise chi-squared test vs true
  ac <- test.segRatio(a$seg.ratios, ploidy=8, method="chi.squared")
  print(addmargins(table(a$true.doses$dosage, ac$dosage, exclude=NULL)))

  ## summarise binomial CI vs true
  ab <- test.segRatio(a$seg.ratios, ploidy=8, method="bin")
  print(addmargins(table(a$true.doses$dosage, ab$dosage, exclude=NULL)))



