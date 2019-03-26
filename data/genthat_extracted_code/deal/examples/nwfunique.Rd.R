library(deal)


### Name: unique.networkfamily
### Title: Makes a network family unique.
### Aliases: unique.networkfamily
### Keywords: iplot

### ** Examples

data(rats)
rats.nwf <- networkfamily(rats)
rats.nwf2<- unique(getnetwork(rats.nwf),equi=TRUE)



