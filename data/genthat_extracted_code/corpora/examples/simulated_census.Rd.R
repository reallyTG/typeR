library(corpora)


### Name: simulated.census
### Title: Simulated census data for examples and illustrations (corpora)
### Aliases: simulated.census FakeCensus
### Keywords: datasets

### ** Examples


FakeCensus <- simulated.census()
summary(FakeCensus)

## Don't show: 
  # some consistency checks
  stopifnot(nrow(FakeCensus) == 502202) 
  stopifnot(! any(is.na(FakeCensus$height) | is.na(FakeCensus$weight) | is.na(FakeCensus$shoe.size)) )
  stopifnot(abs(mean(FakeCensus$height[FakeCensus$sex == "m"]) - 180) < 0.1) 
## End(Don't show)




