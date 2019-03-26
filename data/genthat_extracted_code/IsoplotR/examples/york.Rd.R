library(IsoplotR)


### Name: york
### Title: Linear regression of X,Y-variables with correlated errors
### Aliases: york

### ** Examples

   X <- c(1.550,12.395,20.445,20.435,20.610,24.900,
          28.530,50.540,51.595,86.51,106.40,157.35)
   Y <- c(.7268,.7849,.8200,.8156,.8160,.8322,
          .8642,.9584,.9617,1.135,1.230,1.490)
   n <- length(X)
   sX <- X*0.01
   sY <- Y*0.005
   rXY <- rep(0.8,n)
   dat <- cbind(X,sX,Y,sY,rXY)
   fit <- york(dat)
   covmat <- matrix(0,2,2)
   plot(range(X),fit$a[1]+fit$b[1]*range(X),type='l',ylim=range(Y))
   for (i in 1:n){
       covmat[1,1] <- sX[i]^2
       covmat[2,2] <- sY[i]^2
       covmat[1,2] <- rXY[i]*sX[i]*sY[i]
       covmat[2,1] <- covmat[1,2]
       ell <- ellipse(X[i],Y[i],covmat,alpha=0.05)
       polygon(ell)
   }



