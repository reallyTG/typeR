library(rpnf)


### Name: pnfprocessor
### Title: Generate all point and figure informations for a given time
###   series.
### Aliases: pnfprocessor

### ** Examples

library(rpnf) # Load rpnf library
data(DOW) # (Offline) Load free available sample data from https://www.quandl.com/data/WIKI/DOW
pnfdata <- pnfprocessor(
  high=DOW$High,
  low=DOW$Low,
  date=DOW$Date,
  boxsize=1L,
  log=FALSE)  
pnfdata



