library(hzar)


### Name: hzar.map.greatCircleDistance
### Title: The distance between two points on the Earth's surface.
### Aliases: hzar.map.greatCircleDistance

### ** Examples

hzar.map.greatCircleDistance(89.5,60,89.5,390)
# 28.87587
hzar.map.greatCircleDistance(-89.5,-90,89.5,90)
# 19981.56
hzar.map.greatCircleDistance(-89.5,90,89.5,90)
# 19869.99
hzar.map.greatCircleDistance(0,90,89.5,90)
# 9934.996
hzar.map.greatCircleDistance(0,90,0,-90)
# 20015.12
hzar.map.greatCircleDistance(0,90,0,180)
# 10007.56



