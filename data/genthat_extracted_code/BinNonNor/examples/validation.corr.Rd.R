library(BinNonNor)


### Name: validation.corr
### Title: Validates the specified correlation matrix
### Aliases: validation.corr

### ** Examples

n.BB=2
n.NN=4
corr.vec=NULL
corr.mat=matrix(c(1.0,-0.3,-0.3,-0.3,-0.3,-0.3,
-0.3,1.0,-0.3,-0.3,-0.3,-0.3,
-0.3,-0.3,1.0,0.4,0.5,0.6,
-0.3,-0.3,0.4,1.0,0.7,0.8,
-0.3,-0.3,0.5,0.7,1.0,0.9,
-0.3,-0.3,0.6,0.8,0.9,1.0),6,byrow=TRUE)

validation.corr(n.BB,n.NN,corr.vec=NULL,corr.mat)

n.BB=2
n.NN=4
corr.vec=c(-0.3,-0.3,-0.3,-0.3,-0.3,-0.3,-0.3,-0.3,-0.3,0.4,0.5,0.6,0.7,0.8,0.9)
validation.corr(n.BB,n.NN,corr.vec,corr.mat=NULL)

## Not run: 
##D n.BB=0
##D n.NN=4
##D validation.corr(n.BB,n.NN,corr.vec=NULL,corr.mat)
##D 
##D n.BB=2
##D n.NN=0
##D validation.corr(n.BB,n.NN=0,corr.vec=NULL,corr.mat)
##D 
##D corr.matc=corr.mat[3:6,3:6]
##D validation.corr(n.BB=0,n.NN=4,corr.vec=NULL,corr.mat=corr.matc)
##D 
##D corr.mat[2,1]=0.5
##D validation.corr(n.BB,n.NN,corr.vec=NULL,corr.mat)
##D 
##D corr.mat[1,2]=0.5
##D corr.mat[3,1]=1.5
##D corr.mat[1,3]=1.5
##D validation.corr(n.BB,n.NN,corr.vec=NULL,corr.mat)
##D 
##D npd<-matrix(c(1,     0.477, 0.644, 0.478, 0.651, 0.826,
##D                0.477, 1,     0.516, 0.233, 0.682, 0.75,
##D                0.644, 0.516, 1,     0.599, 0.581, 0.742,
##D                0.478, 0.233, 0.599, 1,     0.741, 0.8,
##D                0.651, 0.682, 0.581, 0.741, 1,     0.798,
##D                0.826, 0.75,  0.742, 0.8,   0.798, 1),
##D                nrow = 6, ncol = 6)
##D 
##D validation.corr(n.BB,n.NN,corr.vec=NULL,corr.mat=npd)
##D 
##D n.BB=1
##D n.NN=0
##D corr.mat<-diag(1)
##D validation.corr(n.BB,n.NN,corr.vec=NULL,corr.mat)
##D 
## End(Not run)



