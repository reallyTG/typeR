library(CollocInfer)


### Name: inneropt
### Title: Inner Optimization Functions
### Aliases: inneropt

### ** Examples

## Not run: 
##D # FitzHugh-Nagumo Equations
##D 
##D data(FhNdata)   # Some data
##D 
##D knots = seq(0,20,0.2)         # Create a basis
##D norder = 3
##D nbasis = length(knots) + norder - 2
##D range = c(0,20)
##D 
##D bbasis = create.bspline.basis(range=range(FhNtimes),nbasis=nbasis,
##D                                     norder=norder,breaks=knots)
##D 
##D lambda = 10000               # Penalty value
##D 
##D DEfd = smooth.basis(FhNtimes,FhNdata,fdPar(bbasis,1,0.5))   # Smooth to estimate
##D                                                             # coefficients first
##D coefs = DEfd$fd$coefs
##D colnames(coefs) = FhNvarnames
##D 
##D profile.obj = LS.setup(pars=FhNpars,coefs=coefs,fn=make.fhn(),
##D                         basisvals=bbasis,lambda=lambda,times=FhNtimes)
##D 
##D lik = profile.obj$lik
##D proc= profile.obj$proc
##D 
##D res = inneropt(FhNdata,times=FhNtimes,FhNpars,coefs,lik,proc,in.meth='nlminb')
##D 
##D plot(fd(res$coefs,bbasis))
## End(Not run)


