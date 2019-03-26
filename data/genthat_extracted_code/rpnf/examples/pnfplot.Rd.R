library(rpnf)


### Name: pnfplot
### Title: Generate a modern point and figure plot
### Aliases: pnfplot

### ** Examples

library(rpnf) # Load rpnf library
data(DOW) # (Offline) Load free available sample data from https://www.quandl.com/data/WIKI/DOW
pnfdata <- pnfprocessor(
  high=DOW$High,
  low=DOW$Low,
  date=DOW$Date,
  boxsize=1L,
  log=FALSE)  
pnfplot(pnfdata,boxsize=1L,log=FALSE)



