library(PoisBinOrdNor)


### Name: intermat
### Title: Calculates and assembles the intermediate correlation matrix
###   entries for the multivariate normal data.
### Aliases: intermat

### ** Examples

## Not run: 
##D num_pois<-2
##D num_bin<-1
##D num_ord<-2
##D num_norm<-1
##D lamvec=sample(10,2)
##D pbin=runif(1)
##D pord=list(c(0.3, 0.7), c(0.2, 0.3, 0.5))
##D nor.mean=3.1
##D nor.var=0.85
##D M=
##D c(-0.05, 0.26, 0.14, 0.09, 0.14, 0.12, 0.13, -0.02, 0.17, 0.29, -0.04, 0.19, 0.10, 0.35, 0.39)
##D N=diag(6)
##D N[lower.tri(N)]=M
##D TV=N+t(N)
##D diag(TV)<-1
##D intmat<-
##D intermat(num_pois,num_bin,num_ord,num_norm,corr_mat=TV,pbin,pord,lamvec,nor.mean,nor.var)
##D 
## End(Not run)



