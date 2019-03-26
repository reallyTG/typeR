library(DAAG)


### Name: grog
### Title: Alcohol consumption in Australia and New Zealand
### Aliases: grog
### Keywords: datasets

### ** Examples

data(grog)
library(lattice)
xyplot(Beer+Wine+Spirit ~ Year | Country, data=grog)
xyplot(Beer+Wine+Spirit ~ Year, groups=Country, data=grog, outer=TRUE)



