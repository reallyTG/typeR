library(clere)


### Name: fitPacs
### Title: fitPacs function
### Aliases: fitPacs
### Keywords: fitPacs fitClere Clere clere function

### ** Examples

   n     <- 100
   p     <-  20
   Beta  <- rep(c(0,2),10)
   eps   <- rnorm(n,sd=3)
   x     <- matrix(rnorm(n*p), nrow = n, ncol = p)
   y     <- as.numeric(10+x%*%Beta+eps)
   bInit <- lm(y~scale(x))$coefficients[-1]
   mod   <- fitPacs(Y=y,X=x,lambda=1.25,betaInput=bInit,epsPACS=1e-5,nItMax=1000) 




