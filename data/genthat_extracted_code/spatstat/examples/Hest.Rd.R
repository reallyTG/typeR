library(spatstat)


### Name: Hest
### Title: Spherical Contact Distribution Function
### Aliases: Hest
### Keywords: spatial nonparametric

### ** Examples

   X <- runifpoint(42)
   H <- Hest(X)
   Y <- rpoisline(10)
   H <- Hest(Y)
   H <- Hest(Y, dimyx=256)
   X <- heather$coarse
   plot(Hest(X))
   H <- Hest(X, conditional=FALSE)

   P <- owin(poly=list(x=c(5.3, 8.5, 8.3, 3.7, 1.3, 3.7),
                       y=c(9.7, 10.0, 13.6, 14.4, 10.7, 7.2)))
   plot(X)
   plot(P, add=TRUE, col="red")
   H <- Hest(X, W=P)
   Z <- as.im(FALSE, Frame(X))
   Z[X] <- TRUE
   Z <- Z[P, drop=FALSE]
   plot(Z)
   H <- Hest(Z)



