library(TSEtools)


### Name: mcPrt
### Title: Matrix Conversion in Portfolio
### Aliases: mcPrt

### ** Examples

fpath<-system.file("extdata", "sample.csv", package="TSEtools")
asset0<-getTSE(fpath)$assets
rtn<-mcPrt(asset0, sub="2016::", pstvRtn=TRUE, pr="weekly")$return



