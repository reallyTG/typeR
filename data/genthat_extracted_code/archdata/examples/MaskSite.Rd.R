library(archdata)


### Name: MaskSite
### Title: Mask Site, Alaska, USA
### Aliases: MaskSite
### Keywords: datasets

### ** Examples

data(MaskSite)
plot(Y~X, MaskSite, main="Mask Site", asp=1, pch=as.numeric(Category), cex=.75)
legend("bottomright", levels(MaskSite$Category), pch=1:5)



