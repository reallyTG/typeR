library(BarcodingR)


### Name: TDR2
### Title: TDR2 Species Membership Value
### Aliases: TDR2
### Keywords: TDR2

### ** Examples


data(TibetanMoth)  
sampleSpeNames<-NAMES(TibetanMoth)
Spp<-gsub(".+,","",sampleSpeNames)
oneSpe<-TibetanMoth[grep("Macdunnoughia_crassisigna", Spp, value = FALSE,fixed = TRUE),] 
oneSpe<-as.DNAbin(as.character(oneSpe[1:5,]))
que<-TibetanMoth[grep("Agrotis_justa", Spp, value = FALSE,fixed = TRUE),] 
que2<-oneSpe[1:2,]
out<-TDR2(oneSpe,que, boot=10,boot2=10) ### true false identification



