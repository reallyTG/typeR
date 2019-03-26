library(BarcodingR)


### Name: FMFtheta12
### Title: Calculate Intraspecific and Interspecific Variation
### Aliases: FMFtheta12
### Keywords: FMFtheta12

### ** Examples


data(TibetanMoth) 
ref<-as.DNAbin(as.character(TibetanMoth[1:50,]))
FMF.theta12<-FMFtheta12(ref)
FMF.theta12



