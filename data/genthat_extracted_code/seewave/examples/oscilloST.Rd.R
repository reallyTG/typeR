library(seewave)


### Name: oscilloST
### Title: Show a stereo time wave as oscillograms
### Aliases: oscilloST
### Keywords: dplot ts

### ** Examples

a<-synth(f=8000,d=1,cf=2000,am=c(50,10),plot=FALSE)
b<-synth(f=8000,d=1,cf=1000,fm=c(0,0,2000,0,0),plot=FALSE)
oscilloST(a,b,f=8000)



