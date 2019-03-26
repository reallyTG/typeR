library(Ultimixt)


### Name: K.MixPois
### Title: Sample from a Poisson mixture posterior associated with a
###   noninformative prior and obtained by Metropolis-within-Gibbs sampling
### Aliases: K.MixPois
### Keywords: Poisson mixture model Non-informative prior

### ** Examples

#N=500
#U =runif(N)                                            
#xobs = rep(NA,N)
#for(i in 1:N){
#    if(U[i]<.6){
#        xobs[i] = rpois(1,lambda=1)
#    }else{
#        xobs[i] = rpois(1,lambda=5)
#    }
#}
#estimate=K.MixPois(xobs, k=2, alpha0=.5, alpha=.5, Nsim=10000)



