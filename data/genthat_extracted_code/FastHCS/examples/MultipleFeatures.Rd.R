library(FastHCS)


### Name: MultipleFeatures
### Title: Fourier coefficients describing the shape of many hand written
###   replications of the numerals '0' and '1'.
### Aliases: MultipleFeatures
### Keywords: datasets

### ** Examples

data(MultipleFeatures)
alpha<-0.5
Q<-15
p<-ncol(MultipleFeatures[,-1])
ns<-FHCSnumStarts(q=Q,eps=(1-alpha)*4/5)
RunExample<-FALSE
if(RunExample){
	Fit<-FastHCS(x=MultipleFeatures[,-1],q=Q,nSamp=ns,seed=1)
	colvec<-rep("orange",nrow(MultipleFeatures))
	colvec[MultipleFeatures[,1]==1]<-"blue"
	plot(Fit,col=colvec,pch=16)
}




