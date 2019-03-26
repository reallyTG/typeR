library(mdsOpt)


### Name: drawIsoquants
### Title: draw series of isoquants
### Aliases: drawIsoquants
### Keywords: isoquants drawing isoquants

### ** Examples

#Example 1
library(mdsOpt)
library(smacof)
library(clusterSim)
data(data_lower_silesian)
z<-data.Normalization(data_lower_silesian, type="n1")
d<-dist.GDM(z, method="GDM1")
res <- smacofSym(delta=d,ndim=2,type="interval")
print("Objects configuration", quote=FALSE)
plot(res, plot.type="confplot")
r1<-res$conf[nrow(z),1]
r2<-res$conf[nrow(z),2]
r3<-res$conf[nrow(z)-1,1]
r4<-res$conf[nrow(z)-1,2]
arrows(r1,r2,r3,r4,length=0.1,col="black")
res_up<-as.matrix(dist(res$conf,method="euclidean"))
drawIsoquants(res$conf[nrow(z)-1,],steps=max(res_up)/6)
# or 
# drawIsoquants(res$conf[nrow(z)-1,],steps=c(0.3,0.2),number=8)

#Example 2
library(mdsOpt)
library(smacof)
library(clusterSim)
data(data_lower_silesian)
z<-data.Normalization(data_lower_silesian, type="n1")
d<-dist.GDM(z, method="GDM1")
res<-smacofSym(delta=d,ndim=2,type="interval")
write.table(res$conf,"conf_2d.csv",dec=",",sep=";",col.names=NA,row.names=TRUE)
alfa<- 1.05*pi
a<- cos(alfa)
b<- -sin(alfa)
c<- sin(alfa)
d<- cos(alfa)
D<-array(c(a,b,c,d), c(2,2))
res1<-read.csv2("conf_2d.csv", header=TRUE, row.names=1)
res1<-as.matrix(res1)
res2<-res1
plot(res2, xlab="Dimension 1",ylab="Dimension 2",main="",asp=1)
points(res2[1:31,],pch=1,font=2)
text(res2[c(1:31),],pos=3,cex=0.7,row.names(z[c(1:31),]))
r1<-res2[nrow(z),1]
r2<-res2[nrow(z),2]
r3<-res2[nrow(z)-1,1]
r4<-res2[nrow(z)-1,2]
arrows(r1,r2,r3,r4,length=0.1,col="black")
res_up<-as.matrix(dist(res2,method="euclidean"))
drawIsoquants(res2[nrow(z)-1,],steps=max(res_up)/6)



