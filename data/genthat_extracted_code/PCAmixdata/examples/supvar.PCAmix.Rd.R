library(PCAmixdata)


### Name: supvar.PCAmix
### Title: Supplementary variables in PCAmix
### Aliases: supvar.PCAmix

### ** Examples

data(wine)
X.quanti <- splitmix(wine)$X.quanti[,1:5]
X.quali <- splitmix(wine)$X.quali[,1,drop=FALSE]
X.quanti.sup <-splitmix(wine)$X.quanti[,28:29]
X.quali.sup <-splitmix(wine)$X.quali[,2,drop=FALSE]
pca<-PCAmix(X.quanti,X.quali,ndim=4,graph=FALSE)
pcasup <- supvar(pca,X.quanti.sup,X.quali.sup)



