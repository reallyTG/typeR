library(CollocInfer)


### Name: Profiling Routines
### Title: Profile Estimation Functions
### Aliases: Profile.LS Profile.multinorm

### ** Examples


###############################
####   Data             #######
###############################

data(FhNdata)

###############################
####  Basis Object      #######
###############################

knots = seq(0,20,0.2)
norder = 3
nbasis = length(knots) + norder - 2
range = c(0,20)

bbasis = create.bspline.basis(range=range(FhNtimes),nbasis=nbasis,
	norder=norder,breaks=knots)


#### Start from pre-estimated values to speed up optimization

data(FhNest)

spars = FhNestPars
coefs = FhNestCoefs

lambda = 10000

res1 = Profile.LS(make.fhn(),data=FhNdata,times=FhNtimes,pars=spars,coefs=coefs,
  basisvals=bbasis,lambda=lambda,in.meth='nlminb',out.meth='nls')

Covar = Profile.covariance(pars=res1$pars,times=FhNtimes,data=FhNdata,
  coefs=res1$coefs,lik=res1$lik,proc=res1$proc) 


## Not run: 
##D ## Alternative, starting from perturbed coefficients -- takes too long for 
##D # automatic checks in CRAN
##D 
##D # Initial values for coefficients will be obtained by smoothing
##D 
##D DEfd = smooth.basis(FhNtimes,FhNdata,fdPar(bbasis,1,0.5))   # Smooth to estimate
##D                                                             # coefficients first
##D coefs = DEfd$fd$coefs
##D colnames(coefs) = FhNvarnames
##D 
##D 
##D ###############################
##D ####     Optimization       ###
##D ###############################
##D 
##D spars = c(0.25,0.15,2.5)          # Perturbed parameters
##D names(spars)=FhNparnames
##D lambda = 10000
##D 
##D res1 = Profile.LS(make.fhn(),data=FhNdata,times=FhNtimes,pars=spars,coefs=coefs,
##D   basisvals=bbasis,lambda=lambda,in.meth='nlminb',out.meth='nls')
##D 
##D par(mfrow=c(2,1))
##D plotfit.fd(FhNdata,FhNtimes,fd(res1$coefs,bbasis))
## End(Not run)  
  
 
 
  
## Not run: 
##D ####################################################
##D ###  An Explicitly Multivariate Normal Formation ### 
##D ####################################################
##D 
##D var = c(1,0.0001)
##D 
##D res2 = Profile.multinorm(make.fhn(),FhNdata,FhNtimes,pars=res1$pars,
##D           res1$coefs,bbasis,var=var,out.meth='nlminb', in.meth='nlminb')
## End(Not run)


