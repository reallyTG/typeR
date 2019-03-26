library(bqtl)


### Name: marker.fill
### Title: Map Positions Between Markers
### Aliases: marker.fill
### Keywords: utilities

### ** Examples



data( little.map.frame  )
little.nint <- marker.fill( little.map.frame, reso=5, TRUE )
cbind(nint=little.nint,cM=little.map.frame$cM)[1:10,]
rm( little.map.frame, little.nint )



