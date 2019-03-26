library(seewave)


### Name: spectro
### Title: 2D-spectrogram of a time wave
### Aliases: spectro
### Keywords: dplot ts

### ** Examples

## Not run: 
##D data(tico)
##D data(pellucens)
##D # simple plots
##D spectro(tico,f=22050)
##D spectro(tico,f=22050,osc=TRUE)
##D spectro(tico,f=22050,scale=FALSE)
##D spectro(tico,f=22050,osc=TRUE,scale=FALSE)
##D # change the dB scale by setting a different dB reference value (20microPa)
##D spectro(tico,f=22050, dBref=2*10e-5)
##D # unnormalised spectrogram with a linear amplitude scale
##D spectro(tico, dB=NULL, norm=FALSE, scale=FALSE)
##D # manipulating wl
##D op<-par(mfrow=c(2,2))
##D spectro(tico,f=22050,wl=256,scale=FALSE)
##D title("wl = 256")
##D spectro(tico,f=22050,wl=512,scale=FALSE)
##D title("wl = 512")
##D spectro(tico,f=22050,wl=1024,scale=FALSE)
##D title("wl = 1024")
##D spectro(tico,f=22050,wl=4096,scale=FALSE)
##D title("wl = 4096")
##D par(op)
##D # vertical zoom using flim
##D spectro(tico,f=22050, flim=c(2,6))
##D spectro(tico,f=22050, flimd=c(2,6))
##D # a full plot
##D pellu2<-cutw(pellucens,f=22050,from=1,plot=FALSE)
##D spectro(pellu2,f=22050,ovlp=85,zp=16,osc=TRUE,
##D     cont=TRUE,contlevels=seq(-30,0,20),colcont="red",
##D     lwd=1.5,lty=2,palette=reverse.terrain.colors)
##D # black and white spectrogram 
##D spectro(pellu2,f=22050,ovlp=85,zp=16,
##D     palette=reverse.gray.colors.1)
##D # colour modifications
##D data(sheep)
##D spectro(sheep,f=8000,palette=temp.colors,collevels=seq(-115,0,1))
##D spectro(pellu2,f=22050,ovlp=85,zp=16,
##D palette=reverse.cm.colors,osc=TRUE,colwave="orchid1") 
##D spectro(pellu2,f=22050,ovlp=85,zp=16,osc=TRUE,palette=reverse.heat.colors,
##D colbg="black",colgrid="white", colwave="white",colaxis="white",collab="white")
## End(Not run)



