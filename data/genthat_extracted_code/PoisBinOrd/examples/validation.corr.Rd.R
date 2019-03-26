library(PoisBinOrd)


### Name: validation.corr
### Title: Validates the specified correlation matrix
### Aliases: validation.corr

### ** Examples

n.P<-1
n.B<-1
n.O<-1
corr.vec=c(0.2,0.1,0.5)
validation.corr(n.P,n.B,n.O,corr.vec,corr.mat=NULL)

n.P<-2
n.B<-2
n.O<-2
corr.mat=matrix(0.5,6,6)
diag(corr.mat)=1
validation.corr(n.P,n.B,n.O,corr.vec=NULL,corr.mat)



