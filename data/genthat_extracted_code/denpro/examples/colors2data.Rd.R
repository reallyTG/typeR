library(denpro)


### Name: colors2data
### Title: Assigns colors to data points
### Aliases: colors2data
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

# colored volume function 
h<-(4/(d+2))^(1/(d+4))*n^(-1/(d+4))*apply(dendat,2,sd)
N<-rep(20,d)
pcf<-pcf.kern(dendat,h,N)
lst<-leafsfirst(pcf)

# colored scatter plot
cd<-colors2data(dendat,pcf,lst)
plot(dendat,col=cd$datacolo)

# colored scatter plot: plot the observations so that the observations with
# the highest density value are plotted last
cd<-colors2data(dendat,pcf,lst)
plot(dendat[cd$ord,1],dendat[cd$ord,2],col=cd$datacolo[cd$ord])




