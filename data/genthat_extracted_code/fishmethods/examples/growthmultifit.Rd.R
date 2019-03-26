library(fishmethods)


### Name: growthmultifit
### Title: Fit a Multi-Group Growth Model
### Aliases: growthmultifit
### Keywords: misc

### ** Examples

data(Kimura)
growthmultifit(len=Kimura$length,age=Kimura$age,group=as.character(Kimura$sex),
model=1,fixed=c(2,1,1),
error=1,select=1,Linf=NULL,K=NULL,t0=NULL,plot=FALSE,control=list(maxiter=10000,
minFactor=1/1024,tol=1e-5))



