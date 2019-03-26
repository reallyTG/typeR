library(snpRF)


### Name: predict.snpRF
### Title: predict method for snpRF objects
### Aliases: predict.snpRF
### Keywords: classif

### ** Examples

data(snpRFexample)
set.seed(111)
ind <- sample(2, nrow(autosome.snps), replace = TRUE, prob=c(0.8, 0.2))
eg.rf <- snpRF(x.autosome=autosome.snps[ind==1,],x.xchrom=xchrom.snps[ind==1,],
               xchrom.names=xchrom.snps.names,x.covar=covariates[ind==1,], 
               y=phenotype[ind==1])
eg.pred <- predict(eg.rf, newdata.autosome=autosome.snps[ind==2,], 
                   newdata.xchrom=xchrom.snps[ind==2,], 
                   xchrom.names=xchrom.snps.names, 
                   newdata.covar=covariates[ind==2,])
table(observed = phenotype[ind==2], predicted = eg.pred)
## Get prediction for all trees.
predict(eg.rf,newdata.autosome=autosome.snps[ind==2,], 
        newdata.xchrom=xchrom.snps[ind==2,], 
        xchrom.names=xchrom.snps.names, 
        newdata.covar=covariates[ind==2,], predict.all=TRUE)
## Proximities.
predict(eg.rf,newdata.autosome=autosome.snps[ind==2,], 
        newdata.xchrom=xchrom.snps[ind==2,], 
        xchrom.names=xchrom.snps.names,	
        newdata.covar=covariates[ind==2,], proximity=TRUE)
## Nodes matrix.
str(attr(predict(eg.rf,newdata.autosome=autosome.snps[ind==2,], 
                 newdata.xchrom=xchrom.snps[ind==2,], 
                 xchrom.names=xchrom.snps.names, 
                 newdata.covar=covariates[ind==2,], nodes=TRUE), "nodes"))



