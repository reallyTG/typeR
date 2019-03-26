library(rpx)


### Name: PXDataset-class
### Title: Class '"PXDataset"'
### Aliases: PXDataset-class class:PXDataset PXDataset
###   pxfiles,PXDataset-method pxfiles pxget,PXDataset-method pxget
###   pxid,PXDataset-method pxid pxref,PXDataset-method pxref
###   pxtax,PXDataset-method pxtax pxurl,PXDataset-method pxurl
###   show,PXDataset-method
### Keywords: classes

### ** Examples

px <- PXDataset("PXD000001")
px
pxtax(px)
pxurl(px)
pxref(px)
pxfiles(px)
fnm <- pxget(px, "PXD000001_mztab.txt")
library("MSnbase")
readMzTabData(fnm, "PEP")
unlink("PXD000001_mztab.txt")



