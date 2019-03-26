library(seewave)


### Name: diffspec
### Title: Difference between two frequency spectra
### Aliases: diffspec
### Keywords: dplot ts

### ** Examples

a <- noisew(f=8000,d=1)
b <- synth(f=8000,d=1,cf=2000)
c <- synth(f=8000,d=1,cf=1000)
d <- noisew(f=8000,d=1)
speca <- spec(a,f=8000,wl=512,at=0.5,plot=FALSE)
specb <- spec(b,f=8000,wl=512,at=0.5,plot=FALSE)
specc <- spec(c,f=8000,wl=512,at=0.5,plot=FALSE)
specd <- spec(d,f=8000,wl=512,at=0.5,plot=FALSE)
diffspec(speca,speca,f=8000)
#[1] 0 => similar spectra of course !
diffspec(speca,specb)
diffspec(speca,specc,plot=TRUE)
diffspec(specb,specc,plot=TRUE)
diffspec(speca,specd,plot=TRUE)
## mel scale
require(tuneR)
data(orni)
data(tico)
orni.mel <- melfcc(orni, nbands = 256, dcttype = "t3", fbtype = "htkmel", spec_out=TRUE)
orni.mel.mean <- apply(orni.mel$aspectrum, MARGIN=2, FUN=mean)
tico.mel <- melfcc(tico, nbands = 256, dcttype = "t3", fbtype = "htkmel", spec_out=TRUE)
tico.mel.mean <- apply(tico.mel$aspectrum, MARGIN=2, FUN=mean)
diffspec(orni.mel.mean, tico.mel.mean, f=22050, mel=TRUE, plot=TRUE)



