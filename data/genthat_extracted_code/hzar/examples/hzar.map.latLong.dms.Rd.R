library(hzar)


### Name: hzar.map.latLong.dms
### Title: Convert D-M-S C strings to degrees
### Aliases: hzar.map.latLong.dms

### ** Examples


# A single value:
hzar.map.latLong.dms(c("9-52 N"))
# A 1:2 matrix:
hzar.map.latLong.dms(c("9-52 N 82 W"))
# A 2:2 matrix with NA for the upper right corner:
hzar.map.latLong.dms(c("9-52-34 E" ,"9-52 N 82 W"))



