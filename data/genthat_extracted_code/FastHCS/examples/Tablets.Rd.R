library(FastHCS)


### Name: Tablets
### Title: Near-infrared (NIR) spectroscopy of a sample of 310 tablets.
### Aliases: Tablets
### Keywords: datasets

### ** Examples

data(Tablets)
alpha<-0.5
Q<-15
p<-ncol(Tablets[,-1])
ns<-FHCSnumStarts(q=Q,eps=(1-alpha)*4/5)
RunExample<-FALSE
if(RunExample){
	Fit<-FastHCS(x=Tablets[,-1],q=Q,nSamp=ns,seed=1,alpha=0.5)
	colvec<-rep("orange",nrow(Tablets))
	colvec[Tablets[,1]==1]<-"blue"
	plot(Fit,col=colvec,pch=16)
}




