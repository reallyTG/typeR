library(SNPassoc)


### Name: plotMissing
### Title: Plot of missing genotypes
### Aliases: plotMissing
### Keywords: utilities

### ** Examples

 data(SNPs)
 data(SNPs.info.pos) 
 ans<-setupSNP(SNPs,colSNPs=6:40,sep="")
 plotMissing(ans)
 
 # The same plot with the SNPs sorted by genomic position and 
 # showing the information about chromosomes

 ans<-setupSNP(SNPs,colSNPs=6:40,sort=TRUE,SNPs.info.pos,sep="") 
 plotMissing(ans)



