library(Segmentor3IsBack)


### Name: SelectModel
### Title: SelectModel
### Aliases: SelectModel
### Keywords: R-package PDPA Segmentation

### ** Examples

require(Segmentor3IsBack);
N=2000 
x=rnbinom(5*N, size=1.3, prob=rep(c(0.7,0.2,0.01,0.2,0.8),each=N))
res=Segmentor(data=x,model=3,Kmax=20);  
# Finds the optimal segmentation in up to 20 segments with respect to 
#the negative binomial model.
Cr<-SelectModel(res,penalty='oracle',keep=FALSE)
Cr
#chooses the number of segments in the segmentation of x using
# an oracle-inequality approach

N=250 
x=rpois(10*N, rep(c(8,1,5,3,16,33,2,12,7,1),each=N))
res=Segmentor(data=x,model=3,Kmax=40);  
# Finds the optimal segmentation in up to 40 segments with respect to 
#the poisson model.
Cr<-SelectModel(res,penalty='BIC',keep=FALSE)
Cr
#chooses the number of segments in the segmentation of x using
# the BIC approach



