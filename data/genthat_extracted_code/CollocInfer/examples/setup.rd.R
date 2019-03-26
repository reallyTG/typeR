library(CollocInfer)


### Name: setup
### Title: Setup Functions for proc and lik objects
### Aliases: setup LS.setup multinorm.setup

### ** Examples


# FitzHugh-Nagumo

t = seq(0,20,0.05)            # Observation times

pars = c(0.2,0.2,3)           # Parameter vector
names(pars) = c('a','b','c')

knots = seq(0,20,0.2)         # Create a basis
norder = 3
nbasis = length(knots) + norder - 2
range = c(0,20)

bbasis = create.bspline.basis(range=range,nbasis=nbasis,norder=norder,breaks=knots)

lambda = 10000               # Penalty value

coefs = matrix(0,nbasis,2)   # Coefficient matrix

profile.obj = LS.setup(pars=pars,coefs=coefs,fn=make.fhn(),basisvals=bbasis,
                       lambda=lambda,times=t)


# Using multinorm

var = c(1,0.01)

profile.obj = multinorm.setup(pars=pars,coefs=coefs,fn=make.fhn(),
                                        basisvals=bbasis,var=var,times=t)


# Henon - discrete

hpars = c(1.4,0.3)
t = 1:200

coefs = matrix(0,200,2)
lambda = 10000

profile.obj = LS.setup(pars=hpars,coefs=coefs,fn=make.Henon(),basisvals=NULL,
                             lambda=lambda,times=t,discrete=TRUE)



