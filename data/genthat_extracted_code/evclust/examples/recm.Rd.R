library(evclust)


### Name: recm
### Title: Relational Evidential c-means algorithm
### Aliases: recm

### ** Examples

## Clustering of the Butterfly dataset
n <- nrow(butterfly)
D<-as.matrix(dist(butterfly))^2
clus<-recm(D,c=2,delta2=50)
m<-clus$mass
plot(1:n,m[,1],type="l",ylim=c(0,1),xlab="objects",ylab="masses")
lines(1:n,m[,2],lty=2)
lines(1:n,m[,3],lty=3)
lines(1:n,m[,4],lty=4)

 ## Clustering the protein data
 data(protein)
 clus <- recm(D=protein$D,c=4,type='full',alpha=0.2,beta=1.1,delta2=20)

 z<- cmdscale(protein$D,k=2)
 plot(clus,X=z,mfrow=c(2,2),ytrue=protein$y,Outliers=FALSE,Approx=1)



