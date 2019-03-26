library(AdvBinomApps)


### Name: ci.syn
### Title: Upper Clopper-Pearson confidence limits under chip synergies
### Aliases: ci.syn
### Keywords: chip synergies

### ** Examples

k<-c(0,1)
n<-c(110000,330000)
ci.syn(k,n,0.1,20e-06)

k<-c(1,0,1,5)
n<-c(330000,240000,240000,400000)
ci.syn(k,n,0.1,20e-06)



