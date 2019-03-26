library(spatstat)


### Name: rmh.ppm
### Title: Simulate from a Fitted Point Process Model
### Aliases: rmh.ppm
### Keywords: spatial models datagen

### ** Examples

   live <- interactive()
   op <- spatstat.options()
   spatstat.options(rmh.nrep=1e5)
   Nrep <- 1e5

   X <- swedishpines
   if(live) plot(X, main="Swedish Pines data")

   # Poisson process
   fit <- ppm(X, ~1, Poisson())
   Xsim <- rmh(fit)
   if(live) plot(Xsim, main="simulation from fitted Poisson model")

   # Strauss process   
   fit <- ppm(X, ~1, Strauss(r=7))
   Xsim <- rmh(fit)
   if(live) plot(Xsim, main="simulation from fitted Strauss model")

   ## Not run: 
##D      # Strauss process simulated on a larger window
##D      # then clipped to original window
##D      Xsim <- rmh(fit, control=list(nrep=Nrep, expand=1.1, periodic=TRUE))
##D      Xsim <- rmh(fit, nrep=Nrep, expand=2, periodic=TRUE)
##D    
## End(Not run)

   ## Not run: 
##D      X <- rSSI(0.05, 100)
##D      # piecewise-constant pairwise interaction function
##D      fit <- ppm(X, ~1, PairPiece(seq(0.02, 0.1, by=0.01)))
##D      Xsim <- rmh(fit)
##D    
## End(Not run)

    # marked point pattern
    Y <- amacrine

   ## Not run: 
##D      # marked Poisson models
##D      fit <- ppm(Y)
##D      fit <- ppm(Y,~marks)
##D      fit <- ppm(Y,~polynom(x,2))
##D      fit <- ppm(Y,~marks+polynom(x,2))
##D      fit <- ppm(Y,~marks*polynom(x,y,2))
##D      Ysim <- rmh(fit)
##D    
## End(Not run)

   # multitype Strauss models
   MS <- MultiStrauss(radii=matrix(0.07, ncol=2, nrow=2),
                      types = levels(Y$marks))
   ## Not run: 
##D     fit <- ppm(Y ~marks, MS)
##D     Ysim <- rmh(fit)
##D    
## End(Not run)

   fit <- ppm(Y ~ marks*polynom(x,y,2), MS)
   Ysim <- rmh(fit)
   if(live) plot(Ysim, main="simulation from fitted inhomogeneous Multitype Strauss")

   spatstat.options(op)

  ## Not run: 
##D     # Hybrid model
##D     fit <- ppm(redwood, ~1, Hybrid(A=Strauss(0.02), B=Geyer(0.1, 2)))
##D     Y <- rmh(fit)
##D   
## End(Not run)



