library(oce)


### Name: section
### Title: Hydrographic section
### Aliases: section

### ** Examples

## Not run: 
##D library(oce)
##D # Gulf Stream
##D data(section)
##D GS <- subset(section, 109<=stationId&stationId<=129)
##D GSg <- sectionGrid(GS, p=seq(0, 5000, 100))
##D plot(GSg, map.xlim=c(-80,-60))
## End(Not run)




