library(PoisBinOrdNor)


### Name: genPBONdata
### Title: Generates correlated data with multiple count, binary, ordinal
###   and normal variables
### Aliases: genPBONdata

### ** Examples

## Not run: 
##D 
##D ss=10000
##D num_pois<-2
##D num_bin<-1
##D num_ord<-2
##D num_norm<-1
##D 
##D lamvec=sample(10,2)
##D pbin=runif(1)
##D pord=list(c(0.1, 0.9), c(0.2, 0.3, 0.5))
##D nor.mean=3.1
##D nor.var=0.85
##D M=c(-0.05, 0.26, 0.14, 0.09, 0.14, 0.12, 0.13, -0.02, 0.17, 0.29, 
##D -0.04, 0.19, 0.10, 0.35, 0.39)
##D N=diag(6)
##D N[lower.tri(N)]=M
##D TV=N+t(N)
##D diag(TV)<-1
##D intmat<-intermat(num_pois,num_bin,num_ord,num_norm,corr_mat=TV,pbin,pord,lamvec,
##D nor.mean,nor.var)
##D 
##D genPBONdata(ss,num_pois,num_bin,num_ord,num_norm,intmat,lamvec,pbin,pord,nor.mean,nor.var)
## End(Not run)



