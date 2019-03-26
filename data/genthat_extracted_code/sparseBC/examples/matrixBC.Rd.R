library(sparseBC)


### Name: matrixBC
### Title: MVN biclustering
### Aliases: matrixBC

### ** Examples

# Lung cancer data
# Not run to save time
#data(lung)
#truecluster<-as.numeric(as.factor(rownames(lung)))
#cancersd<-apply(lung,2,sd)
# Pick the top 400 genes that have the largest standard deviation
#lung<-lung[,rank(cancersd)>=length(cancersd)-399]

# Example of MVN Biclustering
#set.seed(5)
#res<-matrixBC(lung,k=4,r=10,lambda=60,alpha=0.4,beta=0.4) 
# one misclassification
#res$Cs

# lambda chosen such that the estimated mean matirx ofsparseBC has a
# similar number of nonzero as matrixBC
#res2<-sparseBC(lung,k=4,r=10,lambda=230)
# a few observations are being misclassified
#res2$Cs

# print information from the object matrixBC
#summary(res)

# Plot the estimated mean matris for the object matrixBC
#image(res)




