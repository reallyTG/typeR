library(BarcodingR)


### Name: save.ids
### Title: Save Identifications
### Aliases: save.ids
### Keywords: save.ids

### ** Examples



data(TibetanMoth) 
ref<-as.DNAbin(as.character(TibetanMoth[1:50,]))
que<-as.DNAbin(as.character(TibetanMoth[50:60,]))
bsi<-barcoding.spe.identify(ref, que, method = "fuzzyId")
bsi
save.ids(outfile="identified.txt",bsi)



