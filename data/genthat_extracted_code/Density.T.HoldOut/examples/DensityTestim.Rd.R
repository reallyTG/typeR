library(Density.T.HoldOut)


### Name: DensityTestim
### Title: Non-combinatorial T-estimation Hold-Out for density estimation.
### Aliases: DensityTestim

### ** Examples

## Not run: 
##D 	
##D ### load the package
##D library(Density.T.HoldOut)
##D 
##D ### Estimation of the beta density with parameters 5 and 2 from a sample of size 1000:
##D X=rbeta(1000,5,2)
##D DensityTestim(X)
##D x = seq(min(X),max(X),l=500)
##D lines(x,dbeta(x,5,2),col='green',lty=3)
##D title('T-estimation and Least-Squares Held-Out')
##D 
##D 
##D ### Estimation of the lognormal density from a sample of size 500 via a set of regular 
##D ### histograms and parametric estimators build with 3/4 of the sample,
##D ### provide as final estimator the one build with the training sample only:
##D X=rlnorm(500)
##D DensityTestim(X,p=3/4,family=c('RegularHisto','Parametric'),last=c('partial'))
##D x = seq(min(X),max(X),l=500)
##D lines(x,dlnorm(x),col='green',lty=3)
##D title('T-estimation and Least-Squares Held-Out')
##D 
##D 
##D ### Estimation of the chi-square density with 5 degrees of freedom from a sample of 
##D ### size 250 via a set of regular and irregular histograms and kernel estimators with 
##D ### triangular and epanechnikov kernels, start from the maximum likelihood HO estimator:
##D X=rchisq(250,5)
##D DensityTestim(X,family=c('RegularHisto','IrregularHisto','Kernel'),
##D 	kerneltab=c('triangular','epanechnikov'),start=c('MLHO'))
##D x = seq(min(X),max(X),l=500)
##D lines(x,dchisq(x,5),col='green',lty=3)
##D title('T-estimation and Max. Likelihood Hold-Out')
##D 
##D 
##D ### Estimation of a normal mixture from a sample of size 1000 via a set of kernel 
##D ### estimators, provide also the maximum likelihood HO estimator:
##D n=ceiling(runif(1)*1000)
##D X=c(rnorm(n,mean=5,sd=0.1),rnorm(1000-n))
##D DensityTestim(X,family=c('Kernel'),do.MLHO=TRUE)
##D x = seq(min(X),max(X),l=500)
##D lines(x,n/1000*dnorm(x,mean=5,sd=0.1)+(1000-n)/1000*dnorm(x),col='green',lty=3)
##D title('T-estimation, Least-Squares and Max. Likelihood Hold-Out')
##D 
##D 
##D ### Estimation of the gaussian density from a sample of size 500 via a set of regular 
##D ### and irregular histograms estimators, start from the maximum likelihood HO estimator,
##D ### uses the greedy version with constant 1/16:
##D X=rnorm(500)
##D DensityTestim(X,family=c('RegularHisto','IrregularHisto'),start=c('MLHO'),csqrt=1/16)
##D x = seq(min(X),max(X),l=500)
##D lines(x,dnorm(x),col='green',lty=3)
##D title('T-estimation and Max. Likelihood Hold-Out')
## End(Not run)



