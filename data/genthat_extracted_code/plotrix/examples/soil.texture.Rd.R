library(plotrix)


### Name: soil.texture
### Title: Soil texture triangle plot
### Aliases: soil.texture
### Keywords: misc

### ** Examples

 data(soils)
 soil.texture(main="NO DATA")
 soil.texture(soils, main="DEFAULT", pch=2)
 soil.texture(soils, main="LINES AND NAMES", show.lines=TRUE,
  show.names=TRUE, pch=3)
 soiltex.return<-soil.texture(soils[1:6,], main="GRID AND LEGEND",
  show.grid=TRUE, pch=4, col.symbols=1:6, show.legend=TRUE)
 par(soiltex.return$oldpar)



