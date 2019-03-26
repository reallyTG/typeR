library(snpRF)


### Name: classCenter
### Title: Prototypes of groups.
### Aliases: classCenter
### Keywords: classif

### ** Examples

data(snpRFexample)
eg.rf <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
               xchrom.names=xchrom.snps.names,x.covar=covariates, 
               y=phenotype,prox=TRUE)

### interpret Xchromosome output with caution ###

dimnames(xchrom.snps)[[2]]<-paste(rep(xchrom.snps.names,each=2),1:2,sep=".")
classCenter(cbind(autosome.snps,xchrom.snps,covariates), phenotype, eg.rf$prox)





