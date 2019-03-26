library(seewave)


### Name: sh
### Title: Shannon and Renyi spectral entropy
### Aliases: sh
### Keywords: ts

### ** Examples

a<-synth(f=8000,d=1,cf=2000,plot=FALSE)
speca<-spec(a,f=8000,at=0.5,plot=FALSE)
## Shannon spectral entropy
sh(speca)
# [1] 0.2336412
b<-noisew(d=1,f=8000)
specb<-spec(b,f=8000,at=0.5,plot=FALSE)
sh(specb)
# close to 1
## Renyi spectral entropy
sh(speca, alpha=2)
sh(speca, alpha=3)



