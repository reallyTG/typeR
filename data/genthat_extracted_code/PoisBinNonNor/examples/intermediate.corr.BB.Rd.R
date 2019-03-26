library(PoisBinNonNor)


### Name: intermediate.corr.BB
### Title: Computes an intermediate normal correlation matrix for binary
###   variables given the specified correlation matrix
### Aliases: intermediate.corr.BB

### ** Examples

## Not run: 
##D n.P<-2
##D n.B<-2
##D n.C<-2
##D prop.vec=c(0.4,0.7)
##D corr.vec = NULL
##D corr.mat=matrix(c(1.0,-0.3,-0.3,-0.3,-0.3,-0.3,
##D -0.3,1.0,-0.3,-0.3,-0.3,-0.3,
##D -0.3,-0.3,1.0,0.4,0.5,0.6,
##D -0.3,-0.3,0.4,1.0,0.7,0.8,
##D -0.3,-0.3,0.5,0.7,1.0,0.9,
##D -0.3,-0.3,0.6,0.8,0.9,1.0),6,by=TRUE)
##D 
##D intmatBB=intermediate.corr.BB(n.P,n.B,n.C,prop.vec,corr.vec=NULL,corr.mat)
##D intmatBB
## End(Not run)



