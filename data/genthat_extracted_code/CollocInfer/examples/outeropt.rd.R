library(CollocInfer)


### Name: outeropt
### Title: Outer Optimization Functions
### Aliases: outeropt

### ** Examples


## Not run: 
##D data(FhNdata)
##D 
##D knots = seq(0,20,0.2)         # Create a basis
##D norder = 3
##D nbasis = length(knots) + norder - 2
##D range = c(0,20)
##D 
##D bbasis = create.bspline.basis(range=range,nbasis=nbasis,norder=norder,breaks=knots)
##D 
##D lambda = 10000               # Penalty value
##D 
##D DEfd = smooth.basis(FhNtimes,FhNdata,fdPar(bbasis,1,0.5))   # Smooth to estimate
##D                                                             # coefficients first
##D coefs = DEfd$fd$coefs
##D colnames(coefs) = FhNvarnames
##D 
##D profile.obj = LS.setup(pars=FhNpars,coefs=coefs,fn=make.fhn(),basisvals=bbasis,
##D       lambda=lambda,times=FhNtimes)
##D 
##D lik = profile.obj$lik
##D proc= profile.obj$proc
##D 
##D res = outeropt(data=FhNdata,times=FhNtimes,pars=FhNpars,coefs=coefs,lik=lik,proc=proc,
##D     in.meth="nlminb",out.meth="nlminb",control.in=NULL,control.out=NULL)
##D 
##D 
##D plot(res$coefs,main='outeropt')
##D print(blah)
## End(Not run)


