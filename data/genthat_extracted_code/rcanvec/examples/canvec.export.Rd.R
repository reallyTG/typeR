library(rcanvec)


### Name: canvec.export
### Title: Export CanVec Data
### Aliases: canvec.export

### ** Examples

## No test: 
canvec.download(nts("21h01"))
canvec.export(nts("21h01"), "exporteddata", layers=c("road", "river"))
canvec.export(nts("21h01"), "exporteddataUTM", layers=c("road", "river"), 
                 crs=sp::CRS("+init=epsg:26920"))
canvec.export(nts("21h01"), "exporteddata", layers=c("road", "river"), 
               driver="KML")
canvec.export(nts("21h01"), "exporteddataALL")
## End(No test)




