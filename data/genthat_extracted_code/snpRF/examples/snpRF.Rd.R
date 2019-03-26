library(snpRF)


### Name: snpRF
### Title: Classification with Random Forest for SNP Data
### Aliases: snpRF print.snpRF
### Keywords: classif tree

### ** Examples

## Classification:
data(snpRFexample)
set.seed(71)
eg.rf <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
               xchrom.names=xchrom.snps.names,x.covar=covariates, 
               y=phenotype,importance=TRUE, proximity=TRUE)

print(eg.rf)
## Look at variable importance:
round(importance(eg.rf), 2)
## Do MDS on 1 - proximity:
eg.mds <- cmdscale(1 - eg.rf$proximity, eig=TRUE)

print(eg.mds$GOF)



## Grow no more than 4 nodes per tree:
(treesize(snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
                xchrom.names=xchrom.snps.names,x.covar=covariates, 
                y=phenotype, maxnodes=4, ntree=30)))



