library(samr)


### Name: samr.tail.strength
### Title: Estimate tail strength for a dataset, from a SAM analysis
### Aliases: samr.tail.strength
### Keywords: univar survival nonparametric

### ** Examples

#generate some example data
set.seed(100)
x<-matrix(rnorm(1000*20),ncol=20)
dd<-sample(1:1000,size=100)

u<-matrix(2*rnorm(100),ncol=10,nrow=100)
x[dd,11:20]<-x[dd,11:20]+u

y<-c(rep(1,10),rep(2,10))

data=list(x=x,y=y, geneid=as.character(1:nrow(x)),
genenames=paste("g",as.character(1:nrow(x)),sep=""), logged2=TRUE)

samr.obj<-samr(data,  resp.type="Two class unpaired", nperms=100)

samr.tail.strength(samr.obj)




