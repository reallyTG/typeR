library(MitISEM)


### Name: Mit
### Title: The 'mit' object
### Aliases: isMit

### ** Examples

  # a correct Mit definition returns 'TRUE'
  H      <- 2
  p      <- runif(H)
  p      =  p / sum(p) 
  mu     <- matrix(seq(1:H),H,1)
  Sigma  <- matrix(runif(H^2),H,H)
  df     <- seq(1:H)
  isMit(mit=list(p=p,mu=mu,Sigma=Sigma,df=df))

  # an incorrect Mit definition returns 'FALSE'
  mu   = t(mu)
  isMit(mit=list(p=p,mu=mu,Sigma=Sigma,df=df))



