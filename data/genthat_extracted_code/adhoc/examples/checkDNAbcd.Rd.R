library(adhoc)


### Name: checkDNAbcd
### Title: Evaluation of a reference library of aligned DNA barcodes
### Aliases: checkDNAbcd

### ** Examples

data(tephdata);
out1<-checkDNAbcd(tephdata);

#Plot distribution of sequence lengths
hist(out1$DNAlength,main="Seq. lengths",xlab="Seq. length (bp)");

#Plot distribution of pairwise interspecific distances
hist(out1$spdist$inter,main="Intersp. dist",xlab="Distance",col="#0000ff99");

#Plot distribution of pairwise intraspecific distances
hist(out1$spdist$intra, main="Intrasp. dist.",xlab="Distance",col="#0000ff22");

#Plot distribution of both pairwise intra- and interspecific distances
hist(out1$spdist$inter,main="Intra- & intersp. dist",xlab="Distance",col="#0000ff99");
hist(out1$spdist$intra, add=TRUE,col="#0000ff22");

#Idem as previous example with zoom on intraspecific values
hist(out1$spdist$intra,main="Zoom intra- & intersp. dist",xlab="Distance",col="#0000ff99");
hist(out1$spdist$inter, add=TRUE,col="#0000ff22");



