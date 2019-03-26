library(PoisBinNonNor)


### Name: fleishman.coef
### Title: Computes the coefficients of Fleishman third order polynomials
### Aliases: fleishman.coef

### ** Examples

## Not run: 
##D #Consider four continuous variables, which come from
##D #Exp(1),Beta(4,4),Beta(4,2) and Gamma(10,10), respectively.
##D #Skewness and kurtosis values of these variables are as follows:
##D n.C<-4
##D skewness.vec=c(2,0,-0.4677,0.6325)
##D kurtosis.vec=c(6,-0.5455,-0.3750,0.6)
##D coef.mat=fleishman.coef(n.CN,skewness.vec,kurtosis.vec)
##D 
##D n.C<-1
##D skewness.vec=c(0)
##D kurtosis.vec=c(-1.2)
##D coef.mat=fleishman.coef(n.C,skewness.vec,kurtosis.vec)
##D 
##D n.C<-1
##D skewness.vec1=c(3)
##D kurtosis.vec1=c(5)
##D coef.mat=fleishman.coef(n.C,skewness.vec1,kurtosis.vec1)
## End(Not run)



