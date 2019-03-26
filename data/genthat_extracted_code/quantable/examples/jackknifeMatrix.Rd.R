library(quantable)


### Name: jackknifeMatrix
### Title: Compute correlation matrix with jack
### Aliases: jackknifeMatrix

### ** Examples

dataX <- matrix(rnorm(20), ncol=4) 
rownames(dataX)<- paste("R",1:nrow(dataX),sep="")
colnames(dataX)<- paste("C",1:ncol(dataX),sep="")
tmp <- my_jackknife(dataX, cor, use="pairwise.complete.obs", method="pearson")

jackknifeMatrix(dataX, cor)
jackknifeMatrix(dataX, cor, method="spearman")



