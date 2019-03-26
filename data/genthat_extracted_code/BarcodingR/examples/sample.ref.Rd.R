library(BarcodingR)


### Name: sample.ref
### Title: Sample Random Datasets from References (DNAbin)
### Aliases: sample.ref
### Keywords: sample.ref

### ** Examples


data(TibetanMoth) 
data(pineMothITS2)
ref<-TibetanMoth
ref2<-pineMothITS2
out<-sample.ref(ref,sample.porp=0.5,sample.level="full")
out
out2<-sample.ref(ref2,sample.porp=0.5,sample.level="full")
out2





