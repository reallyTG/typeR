library(qrencoder)


### Name: qrencode_raster
### Title: Return a QR encoded string as a raster object
### Aliases: qrencode_raster

### ** Examples

library(raster)
old_mar <- par()$mar
par(mar=c(0,0,0,0))
image(qrencode_raster("http://rud.is/b"), asp=1, col=c("white", "black"),
                                          axes=FALSE, xlab="", ylab="")
par(mar=old_mar)



