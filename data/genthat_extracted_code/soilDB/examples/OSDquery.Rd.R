library(soilDB)


### Name: OSDquery
### Title: Full text searching of the USDA-NRCS Official Series
###   Descriptions
### Aliases: OSDquery
### Keywords: manip

### ** Examples

# find all series that list Pardee as a geographically associated soil.
s <- OSDquery(geog_assoc_soils = 'pardee')
# get data for these series
x <- fetchOSD(s$series, extended = TRUE, colorState = 'dry')
# simple figure
par(mar=c(0,0,1,1))
plot(x$SPC)



