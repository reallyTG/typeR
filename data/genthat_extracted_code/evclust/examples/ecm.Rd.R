library(evclust)


### Name: ecm
### Title: Evidential c-means algorithm
### Aliases: ecm

### ** Examples

## Clustering of the Four-class dataset
data(fourclass)
x<-fourclass[,1:2]
y<-fourclass[,3]
clus<-ecm(x,c=4,type='full',alpha=1,beta=2,delta=sqrt(20),epsi=1e-3,disp=TRUE)
plot(clus,X=x,mfrow=c(2,2),ytrue=y,Outliers=TRUE,Approx=2)



