library(SNPassoc)


### Name: maxstat
### Title: max-statistic for a 2x3 table
### Aliases: maxstat maxstat.default maxstat.table maxstat.setupSNP
###   maxstat.matrix print.maxstat
### Keywords: utilities

### ** Examples


# example from Sladek et al. (2007) for the SNP rs1111875 
 tt<-matrix(c(77,298,310,122,316,231),nrow=2,ncol=3,byrow=TRUE)
 maxstat(tt)

 data(SNPs)
 maxstat(SNPs$casco,SNPs$snp10001) 
 myDat<-setupSNP(SNPs,6:40,sep="")
 maxstat(myDat,casco)

 




