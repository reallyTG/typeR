library(bclust)


### Name: profileplot
### Title: a plot useful to visualise replicated data
### Aliases: profileplot

### ** Examples

data(gaelle)
#take a subset of gaelle data
subgaelle<-gaelle[1:11,]

#use thresholds to define blob colors
blob<-matrix(0,nrow(subgaelle),ncol(subgaelle))
blob[abs(subgaelle)<=0.74]<-0 
blob[abs(subgaelle)>0.74]<-1
blob[abs(subgaelle)>0.94]<-2
blob[abs(subgaelle)>1.28]<-3
profileplot(subgaelle,1:nrow(subgaelle),scale=10,blob.matrix=blob)

#make a profile plot with colored blobs
####### attach a profileplot to a teeth plot
subgaelle.bclust<-bclust(subgaelle,
transformed.par=c(-1.84,-0.99,1.63,0.08,-0.16,-1.68))
# divide plot space into two unequal parts
layout(matrix(c(1,2),1,2,byrow=TRUE), c(9,1),10, respect=TRUE) 
# associate a color to each subject
subgaelle.color<-c(rep("blue",3),rep("green",4),rep("magenta",4))
# find appropriate order to plot subjects
subgaelle.order<-order.dendrogram(as.dendrogram(subgaelle.bclust))
#leave some space for labels 
x.mar<-7
y.mar<-5
profileplot(subgaelle,rep.id=1:nrow(subgaelle),scale=10,
profile.col=subgaelle.color,plot.order=subgaelle.order,
xlab.mar=x.mar,ylab.mar=y.mar)
par(mar=c(x.mar,0,0,0))
teethplot(subgaelle.bclust)

####### nowattach it to a dendrogram plot
layout(matrix(c(2,1),1,2,byrow=TRUE), c(2,8),10, respect=TRUE) 
profileplot(subgaelle,rep.id=1:nrow(subgaelle),scale=10,
profile.col=subgaelle.color,plot.order=subgaelle.order,
xlab.mar=x.mar,ylab.mar=y.mar)
par(mar=c(x.mar,0,0,0))
plot(as.dendrogram(subgaelle.bclust),horiz=TRUE,yaxs="i",
axes=FALSE,leaflab="none")
abline(v=subgaelle.bclust$cut)



