library(FactoClass)


### Name: supqual
### Title: Projection of Qualitative Variables in PCA and MCA
### Aliases: supqual
### Keywords: hplot

### ** Examples

# in PCA
data(admi)
Y<-admi[,2:6]
pcaY<-dudi.pca(Y,scannf=FALSE)
Yqual<-admi[,c(1,8)]
supqual(pcaY,Yqual)
# in MCA
Y<-admi[,c(8,11,9,10)]
mcaY<-dudi.acm(Y,scannf=FALSE)
supqual(mcaY,admi[,c(1,13)])



