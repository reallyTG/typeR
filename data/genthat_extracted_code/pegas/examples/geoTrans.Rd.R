library(pegas)


### Encoding: UTF-8

### Name: geoTrans
### Title: Manipulate Geographic Coordinates
### Aliases: geoTrans
### Keywords: manip

### ** Examples

coord <- c("N 43°27'30\"", "N43°27'30\"", "43°27'30\"N",
           "43° 27' 30\" N", "43 ° 27 ' 30 \" N",
           "43°27'30\"", "43°27.5'")
cat(coord, sep = "\n")
geoTrans(coord)
geoTrans("43 D 27.5'", degsym = "D")
geoTrans("43° 27' 30\" S")



