library(PCAmixdata)


### Name: summary.PCAmix
### Title: Summary of a 'PCAmix' object
### Aliases: summary.PCAmix

### ** Examples

data(wine)
X.quanti <- wine[,c(3:29)] 
X.quali <- wine[,c(1,2)] 
pca<-PCAmix(X.quanti,X.quali,ndim=4, graph=FALSE)
summary(pca)

rot<-PCArot(pca,3,graph=FALSE)
summary(rot)



