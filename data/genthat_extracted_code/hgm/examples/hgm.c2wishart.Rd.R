library(hgm)


### Name: hgm.p2wishart
### Title: The function hgm.p2wishart evaluates the cumulative distribution
###   function of the largest eigenvalues of W1*inverse(W2).
### Aliases: hgm.p2wishart
### Keywords: Cumulative distribution function of random two wishart
###   matrices Holonomic gradient method HGM

### ** Examples

## =====================================================
## Example 1. 
## =====================================================
hgm.p2wishart(m=3,n1=5,n2=10,beta=c(1,2,4),q=4)
## =====================================================
## Example 2. 
## =====================================================
b<-hgm.p2wishart(m=3,n1=5,n2=10,beta=c(1,2,4),q0=0.3,q=20,approxdeg=20,mode=c(1,1,(8+1)*1000));
c<-matrix(b,ncol=8+1,byrow=1);
#plot(c)
## =====================================================
## Example 3. 
## =====================================================
c<-hgm.p2wishart(m=3,n1=5,n2=10,beta=c(1,2,4),q0=0.3,q=20,approxdeg=20,autoplot=1);
#plot(c)



