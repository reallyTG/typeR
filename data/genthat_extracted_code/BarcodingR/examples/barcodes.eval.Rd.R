library(BarcodingR)


### Name: barcodes.eval
### Title: Barcodes Evaluation
### Aliases: barcodes.eval
### Keywords: barcodes.eval

### ** Examples


data(TibetanMoth) 
barcode1<-as.DNAbin(as.character(TibetanMoth[1:30,]))
barcode2<-barcode1
b.eval<-barcodes.eval(barcode1,barcode2,kmer1=1,kmer2=3)
b.eval



