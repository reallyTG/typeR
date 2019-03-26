library(MixedTS)


### Name: setMixedTS.param
### Title: Mixed Tempered Stable distribution
### Aliases: setMixedTS.param MixedTS-parameters

### ** Examples

# Mixed Tempered Stable with Gamma Mixing density.

ParamEx1<-setMixedTS.param(mu0=0, mu=0, sigma=0.4, a=1.5,
                           alpha=0.8, lambda_p=4, lambda_m=1)


# Mixed Tempered Stable with Inverse Gaussian Mixing density.
## As first step we set the "a" parameter 
## equal to the log mgf of the inverse gaussian random variable
# The log mgf of an Ig with parameter (lamb, mu1) is defined as:

logmgf<-("lamb/mu1*(1-sqrt(1-2*mu1^2/lamb*u))")
Mix<-"User"

# The parameters of the mixing density are set by the following command
# line:

parMix<-list(lamb=1,mu1=1)

ParamEx2<-setMixedTS.param(mu0=0, mu=0, sigma=0.4, a=logmgf,
                           alpha=0.8, lambda_p=4, lambda_m=1,
                           Mixing=Mix,paramMixing=parMix)





