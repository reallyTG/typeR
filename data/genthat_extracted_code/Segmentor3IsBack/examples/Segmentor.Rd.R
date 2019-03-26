library(Segmentor3IsBack)


### Name: Segmentor
### Title: Segmentor
### Aliases: Segmentor print.Segmentor Segmentor.default
### Keywords: R-package PDPA Segmentation

### ** Examples

require(Segmentor3IsBack);
N=2000 
x=c(rpois(N,2.0),rpois(2*N,2.2),rpois(N,1.9));
res=Segmentor(data=x,Kmax=3);  
# Finds the optimal segmentation in 1, 2 and 3 segments with respect to 
#the Poisson model.

y=c(rnbinom(N,prob=0.3,size=0.15),rnbinom(2*N,prob=0.1,size=0.15),
rnbinom(N,prob=0.6,size=0.15),compress=FALSE)
res2=Segmentor(y, model=3,Kmax=10); 
#Finds the optimal segmentation in 1 to 10 segments with respect to 
#the Negative Binomial model, without compression of data.



