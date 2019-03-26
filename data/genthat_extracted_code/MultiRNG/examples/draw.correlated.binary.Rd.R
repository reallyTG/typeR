library(MultiRNG)


### Name: draw.correlated.binary
### Title: Generation of Correlated Binary Data
### Aliases: draw.correlated.binary

### ** Examples

cmat<-matrix(c(1,0.2,0.3,0.2,1,0.2,0.3,0.2,1), nrow=3, ncol=3)
propvec=c(0.3,0.5,0.7)
## No test: 
mydata=draw.correlated.binary(no.row=1e5,d=3,prop.vec=propvec,corr.mat=cmat)
apply(mydata,2,mean)-propvec
cor(mydata)-cmat
## End(No test)



