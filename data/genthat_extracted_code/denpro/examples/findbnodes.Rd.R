library(denpro)


### Name: findbnodes
### Title: Finds pointers to the nodes of a level set tree
### Aliases: findbnodes
### Keywords: multivariate smooth

### ** Examples

# generate data
seed<-1
n<-50
d<-2
l<-3; D<-4; c<-D/sqrt(2)
M<-matrix(0,l,d); M[2,]<-c; M[3,]<--c
sig<-matrix(1,l,d)
p<-rep(1/l,l)
dendat<-sim.data(type="mixt",n=n,M=M,sig=sig,p=p,seed=seed)

h<-(4/(d+2))^(1/(d+4))*n^(-1/(d+4))*apply(dendat,2,sd)
N<-rep(20,d)
pcf<-pcf.kern(dendat,h,N)
lst<-leafsfirst(pcf)

nodes<-findbnodes(lst,modenum=3)




