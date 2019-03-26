library(CollocInfer)


### Name: ParsMatch
### Title: Estimate of Parameters from Smooth
### Aliases: ParsMatchOpt ParsMatchErr ParsMatchDP ParsMatchList

### ** Examples


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

DEfd = smooth.basis(FhNtimes,FhNdata,fdPar(bbasis,1,0.5))   # Smooth to estimate
                                                            # coefficients first
coefs = DEfd$fd$coefs
colnames(coefs) = FhNvarnames



#################################
### Initial Parameter Guesses ###
#################################

profile.obj = LS.setup(pars=FhNpars,coefs=coefs,fn=make.fhn(),basisvals=bbasis,
    lambda=1000,times=FhNtimes)
lik = profile.obj$lik
proc= profile.obj$proc

pres = ParsMatchOpt(FhNpars,coefs,proc)

npars = pres$pars



