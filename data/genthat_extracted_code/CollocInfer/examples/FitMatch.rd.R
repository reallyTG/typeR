library(CollocInfer)


### Name: FitMatch
### Title: Estimating Hidden States
### Aliases: FitMatchOpt FitMatchErr FitMatchDC FitMatchDC2 FitMatchList

### ** Examples

###############################
#### Some Data            #####
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


# Initial values for coefficients will be obtained by smoothing

fd.data = FhNdata[,1]

DEfd = smooth.basis(FhNtimes,fd.data,fdPar(bbasis,1,0.5))   

coefs = cbind(DEfd$fd$coefs,rep(0,nbasis))
colnames(coefs) = FhNvarnames

#############################################################
### If We Only Observe One State, We Can Re-Smooth Others ### 
#############################################################

profile.obj = LS.setup(pars=FhNpars,coefs=coefs,fn=make.fhn(),
                      basisvals=bbasis,lambda=1000,times=FhNtimes)
lik = profile.obj$lik
proc= profile.obj$proc

#  DD = Matrix(diag(1,200),sparse=TRUE)
#  tDD = t(DD)

fres = FitMatchOpt(coefs=coefs,which=2,pars=FhNpars,proc)

plot(fd(fres$coefs,bbasis))



