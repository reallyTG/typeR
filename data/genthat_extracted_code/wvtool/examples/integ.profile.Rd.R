library(wvtool)


### Name: integ.profile
### Title: Simple Integration for Making Profile
### Aliases: integ.profile

### ** Examples

data("camphora")
img <- camphora
par(mfrow=c(2,2))
image(rot90c(img),col=gray(c(0:255)/255), useRaster=TRUE, main="camphora",asp=1, axes=FALSE)
integ.profile(img, axis="H", h=c(1,nrow(img)) , v=c(1,ncol(img)), disp=TRUE)
integ.profile(img, axis="V", h=c(1,nrow(img)) , v=c(1,ncol(img)), disp=TRUE)
ps <- log(swap.quad(Mod(fft(img))))
pol <- car2pol(ps)
image(rot90c(ps),col=gray(c(0:255)/255), useRaster=TRUE,main="power spectrum",asp=1, axes=FALSE)
image(rot90c(pol),col=gray(c(0:255)/255), useRaster=TRUE,main="polar map",asp=1)
integ.profile(pol, axis="H", h=c(10,200) , v=c(0,90), disp=TRUE)
integ.profile(pol, axis="V", h=c(70,100) , v=c(0,360), disp=TRUE)



