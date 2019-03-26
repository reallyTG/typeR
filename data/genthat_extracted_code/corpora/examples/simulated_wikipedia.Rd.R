library(corpora)


### Name: simulated.wikipedia
### Title: Simulated type and token counts for Wikipedia articles (corpora)
### Aliases: simulated.wikipedia WackypediaStats
### Keywords: datasets

### ** Examples


WackypediaStats <- simulated.wikipedia()
summary(WackypediaStats)

## Don't show: 
  # some consistency checks
  stopifnot(nrow(WackypediaStats) == 1429649) 
## End(Don't show)




