library(sptemExp)


### Name: rSquared
### Title: Coefficient of Determination
### Aliases: rSquared
### Keywords: ~r2 ~rquared

### ** Examples


  obs=runif(400,1,100)
  pre=obs+rnorm(400,5,10)
  res=obs-pre
  rSquared(obs,res)



