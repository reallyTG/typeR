library(Rtwalk)


### Name: OneMove
### Title: One move of the t-walk
### Aliases: OneMove
### Keywords: Automatic self adjusting MCMC stand alone kernel

### ** Examples
  

#### We first load the twalk package:
library(Rtwalk)



#### A ver simple example, 4 independent normals N(0,1):
x <- runif( 4, min=20, max=21)
xp <-  runif( 4, min=20, max=21)
U <- sum(x^2)/2
Up <- sum(x^2)/2

move  <- OneMove( dim=4, Obj=function(x) { sum(x^2)/2 }
  , Supp=function(x) { TRUE }, x=x, U=U, xp=xp, Up=Up)

if (runif(1) < move$A) ### the actual acceptance probability is min(1,A)
{ ## accepted
      x <- move$y
      U <- move$propU

      xp <- move$yp
      Up <- move$propUp

}
##else Not accepted


### etc.



