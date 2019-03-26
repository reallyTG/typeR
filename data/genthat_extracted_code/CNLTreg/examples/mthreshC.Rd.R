library(CNLTreg)


### Name: mthreshC
### Title: Function to perform 'multiwavelet style' level-dependent soft
###   thresholding for complex-valued wavelet coefficients
### Aliases: mthreshC
### Keywords: manip

### ** Examples


library(adlift)

set.seed(100)

# construct an (irregular) sampling structure:

x<-sort(runif(200))

g<-make.signal2("bumps",x=x)

# generate IID noise with a particular sd
noise<-rnorm(200,0,sd=0.5)

f<-g+noise

# perform forward complex lifting transform

out<-fwtnppermC(x,f,LocalPred=LinearPred,neigh=1)

# have a look at some of the coefficients

out$coeffv[1:10]

# extract lifting matrix and induced lifting variances
W <- out$W

Gpre<-tcrossprod(W,Conj(W))

indsd<-sqrt(diag(Gpre))

# now estimate noise sd using the first artificial level:

al<-artlev(out$lengthsremove,out$removelist)

fine<-(out$coeffv/indsd)[al[[1]]]

varest<-mad(Re(fine))^2

# now compute coefficient covariance structure, see
# Hamilton et al. (2018), Appendix B

C = varest * tcrossprod(W)
    G = varest * Gpre
    P = Conj(G) - t(Conj(C)) 
    Sigma <- array(0, dim = c(2, 2, length(out$coeffv)))
    Sigma[1, 1, ] <- diag(Re(G + C)/2)
    Sigma[2, 2, ] <- diag(Re(G - C)/2)
    Sigma[1, 2, ] <- -diag(Im(G - C)/2)
    Sigma[2, 1, ] <- diag(Im(G + C)/2)

# now threshold complex coefficients according to this structure:

coeff.thresh<-mthreshC(out$coeffv,Sigma,out$removelist,out$pointsin,al)

# have a look at some of these coefficients

coeff.thresh$coeffv[1:10]




