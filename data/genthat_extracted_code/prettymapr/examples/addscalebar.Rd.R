library(prettymapr)


### Name: addscalebar
### Title: Auto Plot Scalebar
### Aliases: addscalebar

### ** Examples

plot(1:5, 1:5, asp=1)
addscalebar(plotunit="m")
## No test: 
library(maptools)
data(wrld_simpl)
plot(wrld_simpl, xlim=c(-66.86, -59.75), ylim=c(43, 47.3)) #Nova Scotia
addscalebar()

#also works in non-lat/lon coordinate systems
addscalebar(plotepsg=3395) #specify plot is in mercator projection
addscalebar(plotepsg=26920) #specify plot is in UTM Zone 20N

## End(No test)




