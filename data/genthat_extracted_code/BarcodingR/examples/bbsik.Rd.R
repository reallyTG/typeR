library(BarcodingR)


### Name: bbsik
### Title: Bp Barcoding Species Identify using Kmer
### Aliases: bbsik
### Keywords: bbsik

### ** Examples

data(TibetanMoth) 
ref<-as.DNAbin(as.character(TibetanMoth[1:50,]))
que<-as.DNAbin(as.character(TibetanMoth[51:60,]))
out<-bbsik(ref, que, kmer = 1, UseBuiltModel = FALSE)
out
out$convergence
out$success.rates.ref

data(pineMothITS2) 
ref<-pineMothITS2
que<-pineMothITS2
out<-bbsik(ref, que, kmer = 1, UseBuiltModel = FALSE)
out
out$convergence
out$success.rates.ref






