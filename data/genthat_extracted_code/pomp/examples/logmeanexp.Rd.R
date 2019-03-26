library(pomp)


### Name: logmeanexp
### Title: The log-mean-exp trick
### Aliases: logmeanexp

### ** Examples

  ## generate a bifurcation diagram for the Ricker map
  pompExample(ricker)
  ll <- replicate(n=5,logLik(pfilter(ricker,Np=1000)))
  ## an estimate of the log likelihood:
  logmeanexp(ll)
  ## with standard error:
  logmeanexp(ll,se=TRUE)



