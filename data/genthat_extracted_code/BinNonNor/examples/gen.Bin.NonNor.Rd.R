library(BinNonNor)


### Name: gen.Bin.NonNor
### Title: Simulates a sample of size n from a set of multivariate binary
###   and continuous non-normal variables
### Aliases: gen.Bin.NonNor

### ** Examples

## Not run: 
##D n=1
##D n.BB=2
##D n.NN=4
##D prop.vec=c(0.4,0.7)
##D mean.vec=c(1,0.5,4/6,100)
##D variance.vec=c(1,0.02777778,0.03174603,1000)
##D skewness.vec=c(2,0,-0.4677,0.6325)
##D kurtosis.vec=c(6,-0.5455,-0.3750,0.6)
##D corr.mat=matrix(c(1.0,-0.3,-0.3,-0.3,-0.3,-0.3,
##D -0.3,1.0,-0.3,-0.3,-0.3,-0.3,
##D -0.3,-0.3,1.0,0.4,0.5,0.6,
##D -0.3,-0.3,0.4,1.0,0.7,0.8,
##D -0.3,-0.3,0.5,0.7,1.0,0.9,
##D -0.3,-0.3,0.6,0.8,0.9,1.0),6,byrow=TRUE)
##D 
##D coef.mat=fleishman.coef(n.NN,skewness.vec,kurtosis.vec)
##D 
##D coef.mat=matrix(c(
##D  -0.31375,  0.00000,  0.10045, -0.10448,
##D   0.82632,  1.08574,  1.10502,  0.98085,
##D   0.31375,  0.00000, -0.10045,  0.10448,
##D   0.02271, -0.02945, -0.04001,  0.00272),4,byrow=TRUE)
##D 
##D intcor.mat=Int.Corr.NN(n.NN,corr.vec=NULL,corr.mat,coef.mat) 
##D 
##D intcor.mat=matrix(c(
##D 1.0000000, 0.4487800, 0.5940672, 0.6471184,
##D 0.4487800, 1.0000000, 0.7099443, 0.8112701,
##D 0.5940672, 0.7099443, 1.0000000, 0.9436195,
##D 0.6471184, 0.8112701, 0.9436195, 1.0000000),4,byrow=TRUE)
##D 
##D tetcor.mat=Tetra.Corr.BB(n.BB,prop.vec,corr.vec=NULL,corr.mat)
##D tetcor.mat=matrix(c(
##D  1.0000000, -0.4713861,
##D -0.4713861,  1.0000000),2,byrow=TRUE)
##D 
##D bicor.mat=Biserial.Corr.BN(n.BB,n.NN,prop.vec,corr.vec=NULL,corr.mat,coef.mat)
##D bicor.mat=matrix(c(
##D -0.4253059, -0.3814058, -0.3862068, -0.3846430,
##D -0.4420613, -0.3964317, -0.4014219, -0.3997964),2,byrow=TRUE)
##D 
##D final.corr.mat=overall.corr.mat(n.BB,n.NN,prop.vec,corr.vec=NULL,corr.mat,coef.mat)
##D 
##D final.corr.mat=matrix(c(
##D   1.0000000, -0.4713861, -0.4253059, -0.3814058, -0.3862068, -0.3846430,
##D  -0.4713861,  1.0000000, -0.4420613, -0.3964317, -0.4014219, -0.3997964,
##D  -0.4253059, -0.4420613,  1.0000000,  0.4487800,  0.5940672,  0.6471184,
##D  -0.3814058, -0.3964317,  0.4487800,  1.0000000,  0.7099443,  0.8112701,
##D  -0.3862068, -0.4014219,  0.5940672,  0.7099443,  1.0000000,  0.9436195,
##D  -0.3846430, -0.3997964,  0.6471184,  0.8112701,  0.9436195,  1.0000000),6, byrow=TRUE)
##D 
##D data=gen.Bin.NonNor(n,n.BB,n.NN,prop.vec,mean.vec,variance.vec,skewness.vec, 
##D kurtosis.vec,final.corr.mat,coef.mat)
##D 
##D amat=final.corr.mat[1:2,1:2]
##D multibin=gen.Bin.NonNor(n=1000,n.BB,n.NN=0,prop.vec,mean.vec=NULL,variance.vec=NULL, 
##D skewness.vec=NULL,kurtosis.vec=NULL,final.corr.mat=amat,coef.mat=NULL)
##D apply(multibin,2,mean)
##D 
##D bmat=final.corr.mat[3:6,3:6]
##D multinonnor=gen.Bin.NonNor(n=100,n.BB=0,n.NN,prop.vec=NULL,mean.vec,variance.vec, 
##D skewness.vec,kurtosis.vec,final.corr.mat=bmat,coef.mat)
##D apply(multinonnor,2,mean)
##D apply(multinonnor,2,var)
##D 
##D 
##D n=1000
##D n.BB=1
##D n.NN=1
##D prop.vec=0.6
##D mean.vec=1
##D variance.vec=1
##D skewness.vec=2
##D kurtosis.vec=6
##D corr.vec=NULL
##D corr.mat=matrix(c(1,-0.3,-0.3,1),2,2)
##D coef.mat=matrix(c(-0.31375,0.82632,0.31375,0.02271),4,1)
##D final.corr.mat=overall.corr.mat(n.BB,n.NN,prop.vec,corr.vec=NULL,corr.mat,coef.mat)
##D data=gen.Bin.NonNor(n,n.BB,n.NN,prop.vec,mean.vec,variance.vec,skewness.vec,
##D kurtosis.vec,final.corr.mat,coef.mat)
##D 
##D 
##D n=1000
##D n.BB=1
##D n.NN=0
##D prop.vec=0.6
##D mean.vec=1
##D variance.vec=NULL
##D skewness.vec=NULL
##D kurtosis.vec=NULL
##D corr.vec=NULL
##D corr.mat=diag(1)
##D coef.mat=NULL
##D final.corr.mat=overall.corr.mat(n.BB,n.NN,prop.vec,corr.vec=NULL,corr.mat,coef.mat)
##D data=gen.Bin.NonNor(n,n.BB,n.NN,prop.vec,mean.vec,variance.vec,skewness.vec, 
##D kurtosis.vec,final.corr.mat,coef.mat)
## End(Not run)



