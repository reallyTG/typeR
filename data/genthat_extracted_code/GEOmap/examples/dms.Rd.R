library(GEOmap)


### Name: dms
### Title: Convert decimal degrees to degree, minutes, seconds
### Aliases: dms
### Keywords: misc

### ** Examples


dms(33.12345)

H = dms(-91.8765)

print(H)

newH = H$d+H$m/60+H$s/3600
print(newH)





