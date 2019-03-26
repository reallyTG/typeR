library(BarcodingR)


### Name: barcoding.gap
### Title: Barcoding Gap Calculation
### Aliases: barcoding.gap
### Keywords: barcoding gap

### ** Examples


data(TibetanMoth)
TibetanMoth<-as.DNAbin(as.character(TibetanMoth[1:20,]))
b.gap<-barcoding.gap(ref=TibetanMoth,dist="K80")
b.gap



