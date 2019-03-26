library(bootSVD)


### Name: fastSVD
### Title: Fast SVD of a wide or tall matrix
### Aliases: fastSVD

### ** Examples

Y<-simEEG(n=100,centered=TRUE,wide=TRUE)
svdY<-fastSVD(Y)
V<-svdY$v #sample PCs for a wide matrix are the right singular vectors
matplot(V[,1:5],type='l',lty=1) #PCs from simulated data

#Note: For a tall, demeaned matrix Y, with columns corresponding
#to subjects and rows to measurements,
#the PCs are the high dimensional left singular vectors.

#Example with 'ff'
dev.off()
library(ff)
Yff<-as.ff(Y)
Vff<-fastSVD(Yff)$v
matplot(Vff[,1:5],type='l',lty=1)



