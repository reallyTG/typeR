library(HRW)


### Name: coral
### Title: Coral organisms in French Polynesia
### Aliases: coral

### ** Examples

library(HRW) ; data(coral)
if (require("lattice"))
   print(xyplot(died ~ logInitialSizePlusOne|siteDepthPeriod*taxon,
                data = coral,layout = c(15,5)))



