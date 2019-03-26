library(hgm)


### Name: hgm.pwishart
### Title: The function hgm.pwishart evaluates the cumulative distribution
###   function of random wishart matrices.
### Aliases: hgm.pwishart
### Keywords: Cumulative distribution function of random wishart matrix
###   Holonomic gradient method HGM

### ** Examples

## =====================================================
## Example 1. 
## =====================================================
hgm.pwishart(m=3,n=5,beta=c(1,2,3),q=10)
## =====================================================
## Example 2. 
## =====================================================
b<-hgm.pwishart(m=4,n=10,beta=c(1,2,3,4),q0=1,q=10,approxdeg=20,mode=c(1,1,(16+1)*100));
c<-matrix(b,ncol=16+1,byrow=1);
#plot(c)
## =====================================================
## Example 3. 
## =====================================================
c<-hgm.pwishart(m=4,n=10,beta=c(1,2,3,4),q0=1,q=10,approxdeg=20,autoplot=1);
#plot(c)



