library(PoisBinOrd)


### Name: intermediate.corr.BO
### Title: Computes an intermediate normal correlation matrix for any
###   combination of binary and ordinal variables given the specified
###   correlation matrix
### Aliases: intermediate.corr.BO

### ** Examples

## Not run: 
##D n.B=1
##D n.O=2
##D prop.vec=0.7
##D prop.list=list(cumsum(c(0.30, 0.40)), cumsum(c(0.4, 0.2, 0.3)))
##D corr.mat=matrix ( c(
##D 1.0000000, 0.1767231, 0.3006186,
##D 0.1767231, 1.0000000, -0.139923,
##D 0.3006186, -0.1399230, 1.0000000),3,3)
##D intmatBO=intermediate.corr.BO(n.B,n.O,prop.vec,prop.list,corr.vec=NULL, 
##D corr.mat)
##D 
##D n.B=1
##D n.O=1
##D prop.vec<-c(0.3)
##D prop.list<-list(c(0.3,0.6))
##D corr.mat=matrix(c(1,0.2,0.1,0.2,1,0.5,0.1,0.5,1),3,3)
##D intmatBO=intermediate.corr.BO(n.B,n.O,prop.vec,prop.list,corr.vec=NULL, 
##D corr.mat)
##D 
##D n.B=2
##D prop.vec=c(0.4,0.7)
##D corr.mat=matrix(c(1,-0.3,-0.3,1),2,2)
##D intmatBB=intermediate.corr.BO(n.B,n.O=0,prop.vec,prop.list=NULL,corr.vec=NULL, 
##D corr.mat)
##D 
##D #See Tetra.Corr.BB in R package BinNonNor 
##D #Tetra.Corr.BB(n.BB=2,prop.vec=c(0.4,0.7),corr.vec=NULL,corr.mat=corr.mat)
##D 
##D n.B=0
##D n.O=2
##D prop.list=list(cumsum(c(0.30, 0.40)), cumsum(c(0.4,0.2,0.3)))
##D corr.mat=matrix(c(1.0000000, -0.139923,-0.139923,1.0000000),2,2)
##D intmatOO=intermediate.corr.BO(n.B,n.O,prop.vec=NULL,prop.list,corr.vec=NULL, 
##D corr.mat)
##D 
##D #See IntermediateOO(plist, OOCorrMat) in R package OrdNor
##D #IntermediateOO(plist=list(cumsum(c(0.30,0.40)),cumsum(c(0.4,0.2,0.3))), 
##D OOCorrMat=corr.mat)
## End(Not run)



