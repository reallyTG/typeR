library(FastHCS)


### Name: DnaAlteration
### Title: Cytosine methylation beta values for a sample of 198
###   non-pathological human tissue specimens.
### Aliases: DnaAlteration
### Keywords: datasets

### ** Examples

data(DnaAlteration)
alpha<-0.5
Q<-15
p<-ncol(DnaAlteration[,-1])
ns<-FHCSnumStarts(q=Q,eps=(1-alpha)*4/5)
RunExample<-FALSE
if(RunExample){
	Fit<-FastHCS(x=DnaAlteration[,-1],q=Q,nSamp=ns,seed=0)
	colvec<-rep("orange",nrow(DnaAlteration))
	colvec[DnaAlteration[,1]==1]<-"blue"
	plot(Fit,col=colvec,pch=16)
}




