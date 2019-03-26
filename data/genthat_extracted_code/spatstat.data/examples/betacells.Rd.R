library(spatstat.data)


### Name: betacells
### Title: Beta Ganglion Cells in Cat Retina
### Aliases: betacells
### Keywords: datasets spatial

### ** Examples

   plot(betacells)
  if(require(spatstat)) {
   area <- marks(betacells)$area
   plot(betacells %mark% sqrt(area/pi), markscale=1)
   }



