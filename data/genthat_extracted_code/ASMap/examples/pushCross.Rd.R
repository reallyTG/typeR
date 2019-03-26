library(ASMap)


### Name: pushCross
### Title: Push markers into an established R/qtl linkage map.
### Aliases: pushCross
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

## pull co-located markers from map

mapDH.c <- pullCross(mapDH, type = "co.located")
mapDH.c$co.located$table

## push co-located markers back into linkage map

mapDH.z <- pushCross(mapDH.c, type = "co.located")
pull.map(mapDH.z)




