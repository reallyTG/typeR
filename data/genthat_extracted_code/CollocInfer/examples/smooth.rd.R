library(CollocInfer)


### Name: Smooth.LS
### Title: Model-Based Smoothing Functions
### Aliases: Smooth.LS Smooth.multinorm

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

res1 = Smooth.LS(make.fhn(),data=FhNdata,times=FhNtimes,pars=spars,coefs=coefs,
  basisvals=bbasis,lambda=lambda,in.meth='nlminb')


## Not run: 
##D # Henon system
##D 
##D hpars = c(1.4,0.3)              # Parameters
##D t = 1:200
##D 
##D x = c(-1,1)                     # Create some dataa
##D X = matrix(0,200+20,2)
##D X[1,] = x
##D 
##D for(i in 2:(200+20)){ X[i,] = make.Henon()$ode(i,X[i-1,],hpars,NULL) }
##D 
##D X = X[20+1:200,]
##D 
##D Y = X + 0.05*matrix(rnorm(200*2),200,2)
##D 
##D basisvals = diag(rep(1,200))    # Basis is just identiy
##D coefs = matrix(0,200,2)
##D 
##D 
##D # For sum of squared errors
##D 
##D lambda = 10000
##D 
##D res1	= Smooth.LS(make.Henon(),data=Y,times=t,pars=hpars,coefs,basisvals=basisvals,
##D   lambda=lambda,in.meth='nlminb',discrete=TRUE)
## End(Not run)


## Not run: 
##D # For multinormal transitions
##D 
##D var = c(1,0.01)
##D 
##D res2 = Smooth.multinorm(make.Henon(),data=Y,t,pars=hpars,coefs,basisvals=NULL,
##D   var=var,in.meth='nlminb',discrete=TRUE)
## End(Not run)



