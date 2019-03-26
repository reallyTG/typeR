library(simone)


### Name: cancer
### Title: Microarray data set for breast cancer
### Aliases: cancer
### Keywords: datasets

### ** Examples

## load the breast cancer data set
data(cancer)
attach(cancer)

## histogram of gene expression levels
par(mfrow=c(1,2))
hist(as.matrix(expr[status == "pcr",]), main="pCR")
hist(as.matrix(expr[status == "not",]), main="not pCR")

## mean of gene expression levels for pCR and not-pCR
colMeans( expr[ which( status=="not"), ] )
colMeans( expr[ which( status=="pcr"), ] )
detach(cancer)



