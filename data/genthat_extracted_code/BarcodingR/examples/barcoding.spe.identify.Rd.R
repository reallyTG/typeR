library(BarcodingR)


### Name: barcoding.spe.identify
### Title: Species Identification using Protein-coding Barcodes
### Aliases: barcoding.spe.identify
### Keywords: barcoding.spe.identify.

### ** Examples


data(TibetanMoth) 
ref<-as.DNAbin(as.character(TibetanMoth[1:5,]))
que<-as.DNAbin(as.character(TibetanMoth[50:55,]))
bsi<-barcoding.spe.identify(ref, que, method = "fuzzyId")
bsi
bsi<-barcoding.spe.identify(ref, que, method = "bpNewTraining")
bsi
bsi<-barcoding.spe.identify(ref, que, method = "Bayesian")
bsi



