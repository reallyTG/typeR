library(spacesXYZ)


### Name: daylight
### Title: Compute Points on the Daylight Locus, in multiple Chromaticity
###   Spaces
### Aliases: daylightLocus
### Keywords: XYZ

### ** Examples

# find some points on the daylight locus, and then their CCT
temp = seq( 2000, 10000, by=1000 )
xy = daylightLocus( temp )
cbind( xy, CCT=CCTfromxy(xy) )
##                x         y      CCT
## D2000         NA        NA       NA
## D3000         NA        NA       NA
## D4000  0.3823436 0.3837663 4000.096
## D5000  0.3457410 0.3586662 4999.749
## D6000  0.3216915 0.3377984 5998.015
## D7000  0.3053570 0.3216459 6997.858
## D8000  0.2937719 0.3092195 7997.599
## D9000  0.2852645 0.2995816 8999.301
## D10000 0.2787996 0.2919672 9991.920



