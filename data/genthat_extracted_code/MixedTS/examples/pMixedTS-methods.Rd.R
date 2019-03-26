library(MixedTS)


### Name: pMixedTS-methods
### Title: Probability of Mixed Tempered Stable distribution
### Aliases: pMixedTS pMixedTS-methods pMixedTS,param.MixedTS-method

### ** Examples

# First Example

# Density of MixedTS with Gamma

ParamEx1<-setMixedTS.param(mu0=0, mu=0, sigma=0.4, a=1.5,
                           alpha=0.8, lambda_p=4, lambda_m=1, 
                           Mixing="Gamma")
# support

x<-seq(-3,1,length=100)

prob1<-pMixedTS(x=x,object=ParamEx1,setSup=10,setInf=-10,N=2^7)

plot(prob1)

# Prob of MixedTS with IG

Mix<-"User"

parMix<-list(lamb=1,mu1=1)

logmgf<-("lamb/mu1*(1-sqrt(1-2*mu1^2/lamb*u))")

ParamEx2<-setMixedTS.param(mu0=0, mu=0, sigma=0.4, a=logmgf,
                           alpha=0.8, lambda_p=4, lambda_m=1,
                           Mixing=Mix,paramMixing=parMix)

x<-seq(-3,1,length=100)

prob2<-pMixedTS(x=x,object=ParamEx2,setSup=10,setInf=-10,N=2^7)
plot(prob2)





