library(spider)


### Name: seeBarcode
### Title: Create illustrative barcodes
### Aliases: seeBarcode
### Keywords: Barcoding Utilities

### ** Examples


graphics::layout(matrix(1:6, ncol=1))
graphics::par(mar=c(0.5, 0, 0.5, 0))
data(woodmouse)
seeBarcode(woodmouse[1,])
seeBarcode(woodmouse[1,], col=c("pink", "orange", "steelblue", "yellow"))
seeBarcode(woodmouse[1,], col=c("black", "white", "white", "black"))
apply(woodmouse[1:3,], MARGIN=1, FUN=seeBarcode)




