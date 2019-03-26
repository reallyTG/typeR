library(ASMap)


### Name: pullCross
### Title: Pull markers from a linkage map.
### Aliases: pullCross
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

## pull co-located markers from linkage map

mapDH.c <- pullCross(mapDH, type = "co.located")
mapDH.c$co.located$table

## pull distorted markers from linkage map using seg.thresh

mapDH.s <- pullCross(mapDH, type = "seg.distortion", pars =
           list(seg.thresh = 0.05))
mapDH.s$seg.distortion$table

## pull distorted markers from linkage map using seg.ratio

mapDH.s <- pullCross(mapDH, type = "seg.distortion", pars =
            list(seg.ratio = "56:44"))
mapDH.s$seg.distortion$table




