library(delt)


### Name: cluster.lst
### Title: Assigns labels to data points
### Aliases: cluster.lst
### Keywords: multivariate smooth

### ** Examples

library(denpro)
# generate data
seed<-1
n<-50
d<-2
l<-3; D<-4; c<-D/sqrt(2)
M<-matrix(0,l,d); M[2,]<-c; M[3,]<--c
sig<-matrix(1,l,d)
p<-rep(1/l,l)
dendat<-sim.data(type="mixt",n=n,M=M,sig=sig,p=p,seed=seed)

# partial clustering with a fixed level 
h<-(4/(d+2))^(1/(d+4))*n^(-1/(d+4))*apply(dendat,2,sd)
N<-rep(20,d)
cl<-cluster.lst(dendat,h,N=N,labels="colors",type="grid",lambda=0.02)
#plot(dendat,col=cl)

# complete clustering with a fixed level
cl<-cluster.lst(dendat,h,N=N,complete=TRUE,labels="colors",type="grid",lambda=0.02)
#plot(dendat,col=cl)

# complete clustering with locally changing levels
N<-rep(20,d)
pcf<-pcf.kern(dendat,h,N)
lst<-leafsfirst(pcf)
nodes<-findbnodes(lst,modenum=3)
cl<-cluster.lst(dendat,h,N,nodes=nodes,complete=TRUE,labels="colors")
#plot(dendat,col=cl)



