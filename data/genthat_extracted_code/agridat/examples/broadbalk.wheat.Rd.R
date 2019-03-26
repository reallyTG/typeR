library(agridat)


### Name: broadbalk.wheat
### Title: Long term wheat yields on Broadbalk fields at Rothamsted.
### Aliases: broadbalk.wheat
### Keywords: datasets

### ** Examples


data(broadbalk.wheat)
dat <- broadbalk.wheat

require(lattice)
## xyplot(grain~straw|plot, dat, type=c('p','smooth'), as.table=TRUE,
##        main="broadbalk.wheat")
xyplot(grain~year|plot, dat, type=c('p','smooth'), as.table=TRUE,
       main="broadbalk.wheat") # yields are decreasing

# See the treatment descriptions to understand the patterns
redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
levelplot(grain~year*plot, dat, main="broadbalk.wheat: Grain", col.regions=redblue)




