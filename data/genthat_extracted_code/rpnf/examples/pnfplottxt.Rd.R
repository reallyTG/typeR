library(rpnf)


### Name: pnfplottxt
### Title: Generate a classical TXT point and figure plot.
### Aliases: pnfplottxt

### ** Examples

library(rpnf) # Load rpnf library
data(DOW) # (Offline) Load free available sample data from https://www.quandl.com/data/WIKI/DOW
pnfdata <- pnfprocessor(
  high=DOW$High,
  low=DOW$Low,
  date=DOW$Date,
  boxsize=1L,
  log=FALSE)  
pnfplottxt(pnfdata,boxsize=1L,log=FALSE)



