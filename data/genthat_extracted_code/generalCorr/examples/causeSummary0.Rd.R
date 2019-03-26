library(generalCorr)


### Name: causeSummary0
### Title: Older Kernel causality summary of evidence for causal paths from
###   three criteria
### Aliases: causeSummary0
### Keywords: SD1, SD2, SD3, SD4, causal index path, summary

### ** Examples



## Not run: 
##D mtx=as.matrix(mtcars[,1:3])
##D ctrl=as.matrix(mtcars[,4:5])
##D  causeSummary0(mtx,ctrl,nam=colnames(mtx))
## End(Not run)

options(np.messages=FALSE)
set.seed(234)
z=runif(10,2,11)# z is independently created
x=sample(1:10)+z/10 #x is somewhat indep and affected by z
y=1+2*x+3*z+rnorm(10)
w=runif(10)
x2=x;x2[4]=NA;y2=y;y2[8]=NA;w2=w;w2[4]=NA
causeSummary0(mtx=cbind(x2,y2), ctrl=cbind(z,w2))





