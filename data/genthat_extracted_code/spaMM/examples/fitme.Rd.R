library(spaMM)


### Name: fitme
### Title: Fitting function for fixed- and mixed-effect models with GLM
###   response.
### Aliases: fitme
### Keywords: model

### ** Examples

## Contrasting different optimization methods:
# We simulate Gamma deviates with mean mu=3 and variance=2, 
#  ie. phi= var/mu^2= 2/9 in the (mu, phi) parametrization of a Gamma 
#  GLM; and shape=9/2, scale=2/3 in the parametrisation of rgamma().
#  Note that phi is not equivalent to scale: 
#  shape = 1/phi and scale = mu*phi.
set.seed(123)
gr <- data.frame(y=rgamma(100,shape=9/2,scale=2/3))
# Here fitme uses HLfit methods which provide cond. SE for phi by default:
fitme(y~1,data=gr,family=Gamma(log))
# To force outer optimization of phi, use the init argument:
fitme(y~1,data=gr,family=Gamma(log),init=list(phi=1))
# To obtain cond. SE for phi after outer optimization, use the 'refit' control:
fitme(y~1,data=gr,family=Gamma(log),,init=list(phi=1),
      control=list(refit=list(phi=TRUE))) ## or ...refit=TRUE...

## see help("COMPoisson"), help("negbin"), help("Loaloa"), etc., for further examples.



