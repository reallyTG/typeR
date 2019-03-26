library(prettymapr)


### Name: prettymapr-package
### Title: Scale Bar, North Arrow, And Pretty Margins In R
### Aliases: prettymapr-package prettymapr
### Keywords: package

### ** Examples

#dont test to cut down on check time
## No test: 
#bbox functions make it easy to manipulate bounding boxes
wolfville <- searchbbox("wolfville ns")
wolfvillezoomedout <- zoombbox(wolfville, 0.5)

#scalebar() makes it easy to add a scalebar to any map
library(maptools)
data(wrld_simpl)
plot(wrld_simpl, xlim=c(-66.86, -59.75), ylim=c(43, 47.3)) #Nova Scotia
addscalebar()

#also works in non-lat/lon coordinate systems
addscalebar(plotepsg=3395) #specify plot is in mercator projection
addscalebar(plotepsg=26920) #specify plot is in UTM Zone 20N

#addnortharrow() adds a north arrow
addnortharrow()

#prettymap() sets margins and plots scalebar and north arrow
library(maptools)
data(wrld_simpl)
prettymap(plot(wrld_simpl, xlim=c(-66.86, -59.75), ylim=c(43, 47.3)),
          arrow.scale=1.1)

#example using {rosm} (open street map tiles)
library(rosm)
prettymap(osm.plot(wolfville))
## End(No test)




