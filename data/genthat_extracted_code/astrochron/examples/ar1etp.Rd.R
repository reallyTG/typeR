library(astrochron)


### Name: ar1etp
### Title: AR(1) + ETP simulation routine
### Aliases: ar1etp

### ** Examples

## No test: 

# run simulations using the default settings
ar1etp()

# compare with a second model:
# generate etp model spanning 0-2000 ka, with sampling interval of 5 ka.
ex1=etp(tmin=0,tmax=2000,dt=5)
# run simulations, with rho=-.7, and scaling noise to have 50% of the etp model variance
ar1etp(etpdat=ex1,rho=0.7,wtAR=sqrt(0.5))

## End(No test)



