library(MitISEM)


### Name: Mvgt
### Title: General student t distribution
### Aliases: dmvgt rmvgt

### ** Examples

  H      <- 2
  p      <- runif(H)
  p      =  p / sum(p) 
  mu     <- matrix(seq(1:H),H,1)
  Sigma  <- matrix(runif(H^2),H,H)
  df     <- seq(1:H)  
  Ndraws <- rmvgt(N=10,mit=list(p=p,mu=mu,Sigma=Sigma,df=df))
  pdraws <- dmvgt(theta=Ndraws,mit=list(p=p,mu=mu,Sigma=Sigma,df=df))



