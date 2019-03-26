library(PoisBinNonNor)


### Name: validation.corr
### Title: Validates the specified correlation matrix
### Aliases: validation.corr

### ** Examples

n.P<-1
n.B<-1
n.C<-1
corr.vec=c(0.2,0.1,0.5)
validation.corr(n.P,n.B,n.C,corr.vec,corr.mat=NULL)

n.P<-2
n.B<-2
n.C<-2
corr.mat=matrix(0.5,6,6)
diag(corr.mat)=1
validation.corr(n.P,n.B,n.C,corr.vec=NULL,corr.mat)

## Not run: 
##D n.P<-2
##D n.B<-2
##D n.C<-1
##D corr.mat=matrix(0.5,6,6)
##D diag(corr.mat)=1
##D validation.corr(n.P,n.B,n.C,corr.vec=NULL,corr.mat)
##D 
##D n.P<-2
##D n.B<-2
##D n.C<-2
##D corr.mat=matrix(0.5,6,6)
##D corr.mat[1,2]=0.4
##D diag(corr.mat)=1
##D validation.corr(n.P,n.B,n.C,corr.vec=NULL,corr.mat)
## End(Not run)



