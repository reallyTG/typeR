library(extraBinomial)


### Name: exbio
### Title: Extra-binomial approach for pooled sequencing data
### Aliases: exbio

### ** Examples

R<-matrix(c(1409,1530,1490,1630,924,998,1000,1012),nrow=2,ncol=4,byrow=TRUE)
R.alt<-matrix(c(170,210,192,209,13,14,30,38),nrow=2,ncol=4,byrow=TRUE)
cc<-c(0,0,1,1)
n=96
exbio(R, R.alt, cc, n, max.it = 100, digits=3)
##=> p.value = 9.91e-01 for SNP1 and 4.01e-11 for SNP2,
##so association for SNP2 is established, but not for SNP1.




