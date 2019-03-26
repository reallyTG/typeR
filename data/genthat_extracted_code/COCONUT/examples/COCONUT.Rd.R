library(COCONUT)


### Name: COCONUT
### Title: COmbat CO-Normalization Using conTrols: COCONUT
### Aliases: COCONUT
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(GSEs.test)

## apply COCONUT to a very small test case
## (3 datasets with 10 patients and 2000 genes)
GSEs.COCONUT <- COCONUT(GSEs=GSEs.test,
                        control.0.col="Healthy0.Sepsis1",
                        byPlatform=FALSE)

## make gene matrices
COCONUTgenes <- Reduce(cbind, lapply(GSEs.COCONUT$COCONUTList, function(x) x$genes))
rawgenes <- Reduce(cbind, lapply(GSEs.COCONUT$rawDiseaseList, function(x) x$genes))

### plot not run; (uncomment for plot)
### plot pre- and post-normalized data
# plot(x=1:ncol(COCONUTgenes), y=COCONUTgenes["ATP6V1B1", ], ylim=c(0,6), pch=20, col=1)
# points(x=1:ncol(rawgenes), y=rawgenes["ATP6V1B1", ], ylim=c(0,6), pch=20, col=2)


## compare distributions before and after COCONUT
classvec <- GSEs.test$GSE28750$pheno$Healthy0.Sepsis1
prior <- GSEs.test$GSE28750$genes
post <- cbind(GSEs.COCONUT$controlList$GSEs$GSE28750$genes,
              GSEs.COCONUT$COCONUTList$GSE28750$genes)

prior.t.stats <- apply(prior, 1, function(geneRow){
    geneByClass <- split(geneRow, classvec)
    gene.test <- t.test(geneByClass[[1]], geneByClass[[2]])
    gene.test$statistic
})

post.t.stats <- apply(post, 1, function(geneRow){
    geneByClass <- split(geneRow, classvec)
    gene.test <- t.test(geneByClass[[1]], geneByClass[[2]])
    gene.test$statistic
})

summary(prior.t.stats-post.t.stats)

## thus gene distributions are preserved within datasets, but normalized
## between datasets




