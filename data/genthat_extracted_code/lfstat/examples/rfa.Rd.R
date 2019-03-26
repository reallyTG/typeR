library(lfstat)


### Name: rfa
### Title: Regional Frequency Analysis
### Aliases: rfa
### Keywords: Regional Frequency Analysis

### ** Examples

data(ngaruroro)

#Toy example to get some more "rivers"
seventies <- subset(ngaruroro, hyear %in% 1970:1979)
eighties <- subset(ngaruroro, hyear %in% 1980:1989)
nineties <- subset(ngaruroro, hyear %in% 1990:1999)

toyrfa <- rfa(list(seventies,eighties,nineties), n=3,dist = "gev")

# Now you can work on using Hoskings lmomRFA-package, e.g.
require(lmomRFA)
regquant(c(1/1000,1/100),toyrfa)
sitequant(1/100,toyrfa)




