library(SDraw)


### Name: bas.polygon
### Title: Draws a Balanced Acceptance Sample (BAS) from an area resource
###   (polygons).
### Aliases: bas.polygon
### Keywords: design survey

### ** Examples

#   Draw sample
WA_sample <- bas.polygon(WA, 100)  

#   Plot
plot( WA )

# Plot first 100 sample locations
points( WA_sample[ WA_sample$siteID <= 100, ], pch=16 ) 

# Plot second 100 locations 
points( WA_sample[ WA_sample$siteID >  100, ], pch=1 )  





