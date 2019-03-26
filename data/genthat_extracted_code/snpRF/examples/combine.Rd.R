library(snpRF)


### Name: combine
### Title: Combine Ensembles of Trees
### Aliases: combine
### Keywords: classif

### ** Examples

data(snpRFexample)
rf1 <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
             xchrom.names=xchrom.snps.names,x.covar=covariates, 
             y=phenotype,ntree=50, norm.votes=FALSE)
rf2 <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
             xchrom.names=xchrom.snps.names,x.covar=covariates, 
             y=phenotype,ntree=50, norm.votes=FALSE)
rf3 <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
             xchrom.names=xchrom.snps.names,x.covar=covariates, 
             y=phenotype,ntree=50, norm.votes=FALSE)

rf.all <- combine(rf1, rf2, rf3)
print(rf.all)



