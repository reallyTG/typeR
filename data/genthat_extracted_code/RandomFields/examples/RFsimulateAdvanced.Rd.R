library(RandomFields)


### Name: RFsimulateAdvanced
### Title: Simulation of Random Fields - Advanced
### Aliases: RFsimulateAdvanced
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Don't show: ## Not run: 
##D 
##D #############################################################
##D ##                                                         ##
##D ## Example 1: Specification of simulation method           ##
##D ##                                                         ##
##D #############################################################
##D 
##D  ## usage of a specific method
##D  ## -- the complete list is obtained by RFgetMethodNames()
##D  model <- RMstable(alpha=1.5)
##D  x <- runif(100, max=20) 
##D  y <- runif(100, max=20) # 100 points in 2 dimensional space
##D  simulated <- RFsimulate(model = RPdirect(model), x=x, y=y) # cholesky
##D  plot(simulated)
##D 
##D 
##D 
##D #############################################################
##D ##                                                         ##
##D ## Example 2: Turnung band with different number of lines  ##
##D ##                                                         ##
##D #############################################################
##D model <- RMstable(alpha=1.5)
##D x <- seq(0, 10, 0.01)
##D z <- RFsimulate(model = RPtbm(model), x=x, y=x)
##D plot(z)
##D 
##D 
##D 
##D #############################################################
##D ##                                                         ##
##D ## Example 3: Shot noise fields (random coins)             ##
##D ##                                                         ##
##D #############################################################
##D 
##D  x <- GridTopology(0, .1, 500)
##D 
##D  z <- RFsimulate(model=RPpoisson(RMgauss()), x=x, mpp.intensity = 100)
##D 
##D  plot(z)
##D  par(mfcol=c(2,1))
##D  plot(z@data[,1:min(length(z@data), 1000)], type="l")
##D  hist(z@data[,1])
##D  
##D  
##D  z <- RFsimulate(x=x, model=RPpoisson(RMball()), mpp.intensity = 0.1)
##D  
##D  plot(z)
##D  par(mfcol=c(2,1))
##D  plot(z@data[,1:min(length(z@data), 1000)], type="l")
##D  hist(z@data[,1])
##D  
##D 
##D 
##D 
##D  #############################################################
##D  ##                                                         ##
##D  ## Example 4: a 2d random field based on                   ##
##D  ## covariance functions valid in 1d only                   ##
##D  ##                                                         ##
##D  #############################################################
##D 
##D x <- seq(0, 2, 0.1)
##D model <- RMfbm(alpha=0.5, Aniso=matrix(nrow=1, c(1, 0))) + 
##D          RMfbm(alpha=0.9, Aniso=matrix(nrow=1, c(0, 1)))
##D z <- RFsimulate(x, x, model=model)
##D plot(z)
##D 
##D 
##D 
##D #############################################################
##D ##                                                         ##
##D ## Example 5 : Brownian sheet                              ##
##D ## (using Stein's method)                                  ##
##D ##                                                         ##
##D #############################################################
##D  
##D # 2d
##D step <- 0.3 ## nicer, but also time consuming if step = 0.1
##D x <- seq(0, 5, step)
##D alpha <- 1 # in [0,2)
##D z <- RFsimulate(x=x, y=x, model=RMfbm(alpha=alpha))
##D plot(z)
##D 
##D 
##D # 3d
##D z <- RFsimulate(x=x, y=x, z=x,
##D  model=RMfbm(alpha=alpha))
##D 
##D 
##D #############################################################
##D ##                                                         ##
##D ## Example 5 : Non-Geometric anisotropy                    ##
##D ##                                                         ##
##D #############################################################
##D 
##D x <- seq(0.1, 6, 0.12)
##D Aniso <- R.c(R.p(1)^2, R.p(2)^1.5)
##D z <- RFsimulate(RMexp(Aniso = Aniso) + 10, x, x)
##D plot(z) 
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


