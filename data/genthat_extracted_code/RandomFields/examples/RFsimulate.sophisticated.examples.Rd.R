library(RandomFields)


### Name: RFsimulate.sophisticated.examples
### Title: Sophisticated Examples for the Simulation of Random Fields
### Aliases: RFsimulate.sophisticated.examples

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
##D ## Example 1: Gaussian field approximated by Poisson fields##
##D ##                                                         ##
##D #############################################################
##D 
##D for (mpp.intensity in c(1, 10, 100)){
##D   # mpp.intensity of 1 is much too small but illustrates
##D   # how the "Coins" method works
##D 
##D   z <- RFsimulate(x=x, model=RPcoins(RMspheric()),
##D   mpp.intensity = mpp.intensity)
##D   #getOption("device")()
##D   plot(z)
##D   readline("press return")
##D }
##D 
##D par(mfcol=c(2,1))
##D plot(z@data[,1:min(length(z@data), 1000)], type="l")
##D hist(z@data[,1])
##D 
##D 
##D 
##D #############################################################
##D ##                                                         ##
##D ## Example 2: A max-stable random field                    ##
##D ##                                                         ##
##D #############################################################
##D 
##D ### Smith's Gaussian extremal process
##D x <- GridTopology(0, .1, 500)
##D z <- RFsimulate(RPsmith(RMgauss()), x=x, n=10)
##D plot(z, nmax=3)
##D 
##D z <- as.vector(as.matrix(z@data))
##D 
##D par(mfcol=c(2,1))
##D plot(pmin(15, z[1:min(length(z), 1000)]), type="l")
##D hist(ylim=c(0,1), pmin(z,5), 200, freq=FALSE)
##D xx <- seq(0,4,len=1000)
##D lines(xx, exp(-1/xx) / xx^2)
##D  
##D  
##D ## a more complicated mixed moving maximum process
##D model <- RPsmith(RMmppplus(RMgauss(), RMexp(), p=c(0.3, 0.7)))
##D z <- RFsimulate(model, x=x, n=10)
##D  
##D plot(z, nmax=1, ylim=c(0, 15))
##D 
##D z<-as.vector(as.matrix(z@data))
##D par(mfcol=c(2,1))
##D plot(pmin(15, z[1:min(length(z), 1000)]), type="l")
##D hist(ylim=c(0,1), pmin(z,5), 200, freq=FALSE)
##D xx <- seq(0,4,len=1000)
##D lines(xx, exp(-1/xx) / xx^2)
##D 
##D  
##D ## there are different possibilities to define a max-stable process:
##D ## * m[[1]] below is a detailed way of defining a model.
##D ## * m[[2]] is the same as m[[1]] as only one component is given
##D ## * m[[3]] uses the fact that the standard schlather model is based 
##D ##          on a Gaussian random field. So, it suffices to pass the
##D ##          covariance model
##D 
##D m <- list(RMmppplus(RPgauss(RMgauss())),
##D           RPgauss(RMgauss()),
##D           RMgauss())
##D 
##D  x <- GridTopology(0, .1, 500)
##D 
##D for (i in 1:3){ ##D 
##D   z <- RFsimulate(model=Schlather(m[[i]]),x=x, n=2, seed=0)
##D 
##D   plot(z, nmax=1, ylim=c(0, 15))
##D   z <- as.vector(as.matrix(z@data))
##D 
##D   par(mfcol=c(2,1))
##D   plot(pmin(10, z[1:min(length(z), 1000)]), type="l")
##D   hist(ylim=c(0,1), pmin(z,5), 200, freq=FALSE)
##D   xx <- seq(0,4,len=1000)
##D   lines(xx, exp(-1/xx) / xx^2)
##D   print(quantile(as.vector(z), probs=seq(0,1,0.05)))
##D }
##D  
##D  
##D ## mixture of extremal Gaussian models:
##D x <- GridTopology(0, .03, 500)
##D model <- RMmppplus(RPgauss(RMgauss()), RPgauss(RMexp()),
##D                    p = c(0.7, 0.3))
##D 
##D z <- RFsimulate(model = Schlather(model), x=x, 
##D gauss.meth="sp", n=1)
##D plot(z)
##D 
##D z <- as.vector(as.matrix(z@data))
##D par(mfcol=c(2,1))
##D plot(pmin(1000, z[1:min(length(z), 1001)]), type="l")
##D hist(ylim=c(0,1), pmin(z, 5), 200, freq=FALSE)
##D xx <- seq(0,4,len=1000)
##D lines(xx, exp(-1/xx) / xx^2)
##D print(summary(z))
##D 
##D 
##D 
##D ## non-separable space-time model applied for two space dimensions
##D ## note that tbm method works in some special cases.
##D x <- y <- seq(0, 7, 0.05)
##D T <- c(1,32,1) * 10 ## note necessarily gridtriple definition
##D model <- RMnsst(aniso=diag(c(3, 3, 0.02)), delta=2,
##D                 phi=RMgauss(), psi=RMgenfbm(alpha=1, delta=0.5))
##D z <- RFsimulate(x=x, y=y, T=T, model=model,
##D                 method="ci", CE.strategy=1, CE.trials=4)
##D rl <- function() readline("Press return")
##D for (i in 1:dim(z)[3]) { image(z[,,i], zlim=range(z)); rl();}
##D for (i in 1:dim(z)[2]) { image(z[,i,], zlim=range(z)); rl();}
##D for (i in 1:dim(z)[1]) { image(z[i,,], zlim=range(z)); rl();}
##D 
##D 
##D 
##D #############################################################
##D ## Example 3 shows the benefits from stored,               ##
##D ## intermediate results: in case of the circulant          ##
##D ## embedding method, the speed is doubled in the second    ##
##D ## simulation.                                             ## 
##D #############################################################
##D 
##D RFoptions(storing=TRUE)
##D y <- x <- seq(0, 50, 0.1)
##D (p <- c(runif(3), runif(1)+1))
##D ut <- system.time(f <- RFsimulate(RPcirculant(RMexp())), x=x, y=y)
##D 
##D plot(f) 
##D 
##D 
##D cat("system time (first call)", format(ut,dig=3),"\n")
##D 
##D # second call with the same paramters can be much faster:
##D ut <- system.time(f <- RFsimulate()) 
##D plot(f) 
##D 
##D 
##D 
##D cat("system time (second call)", format(ut,dig=3),"\n")
##D 
##D #############################################################
##D ##                                                         ##
##D ## Example 4: how the cutoff method can be set             ##
##D ## explicitly using hypermodels                            ##
##D ##                                                         ##
##D #############################################################
##D 
##D ## NOTE: this feature is still in an experimental stage
##D ## which has not been yet tested intensively;
##D ## further: arguments and algorithms may change in
##D ## future.
##D 
##D 
##D ## simuation of the stable model using the cutoff method
##D x <- seq(0, 1, 1/24) # nicer pictures with 1/240
##D scale <- 1.0
##D model1 <- RPcutoff(RMstable(alpha=1, scale=scale))
##D rs <- get(".Random.seed", envir=.GlobalEnv, inherits = FALSE)
##D z1 <- RFsimulate(x, x, model=model1, n=1, storing=TRUE)
##D (size <- RFgetRegisterInfo(meth=c("cutoff", "circ"))$S$size)
##D cut.off.param <- RFgetRegisterInfo(meth=c("cutoff", "circ"),
##D                                    modelname="cutoff")$param
##D print(cut.off.param)
##D plot(z1)
##D 
##D ## simulation of the same random field using the circulant
##D ## embedding method and defining the hypermodel explicitely
##D model2 <- RMcutoff(scale = scale, diam=cut.off.param$diam, a=cut.off.param$a, 
##D                    RMstable(alpha=1.0))
##D 		 
##D assign(".Random.seed", rs, envir=.GlobalEnv)
##D z2 <- RFsimulate(x, x, gridtriple=FALSE, model=model2,
##D                  meth="circulant", n=1, CE.mmin=size, Storing=TRUE)
##D image(x, x, z2)
##D Print(range(z1-z2)) ## essentially no difference between the fields!
##D 
##D 
##D 
##D #############################################################
##D ## Example 5:                                              ##
##D ## The cutoff method simulates on a torus and a (small)    ##
##D ## rectangle is taken as the required simulation.          ##
##D ##                                                         ##
##D ## The following code shows a whole such torus.            ##
##D ## The main part of the code sets local.dependent=TRUE and ##
##D ## local.mmin to multiples of the basic rectangle lengths  ##
##D #############################################################
##D 
##D # definition of the realisation
##D RFoptions(circulant.useprimes=FALSE)
##D x <- seq(0, 2, len=4) # better 20
##D y <- seq(0, 1, len=5) # better 40
##D grid.size <- c(length(x), length(y))
##D model <- RMexp(var=1.1, aniso=matrix(nc=2, c(2, 1, 0.5, 1)))
##D 
##D # determination of the (minimal) size of the torus
##D InitRFsimulate(x, y, model=model, method="cutoff")
##D ce.info.size <- RFgetRegisterInfo(meth=c("cutoff", "circ"))$S$size
##D blocks <- ceiling(ce.info.size / grid.size / 4) *4
##D (size <- blocks * grid.size)
##D 
##D # simulation and plot of the torus 
##D z <- RFsimulate(x, y, model=model, method="cu",
##D                 n=prod(blocks) * 2,
##D                 local.dependent=TRUE, local.mmin=size)[,,c(TRUE, FALSE)]
##D height <- 8
##D ScreenDevice(height=height,
##D              width=height / blocks[2] / diff(range(y)) *
##D                    blocks[1] * diff(range(x))))
##D 
##D close.screen(all = TRUE)
##D sc <- matrix(nc=blocks[1], split.screen(rev(blocks)), byrow=TRUE)
##D sc <- as.vector(t(sc[nrow(sc):1, ]))
##D 
##D for (i in 1:prod(blocks)) {
##D   screen(sc[i])
##D   par(mar=rep(1, 4) * 0.0)
##D   image(z[,, i], zlim=c(-3, 3), axes=FALSE, col=rainbow(100)) 
##D }
##D 
##D 
##D close.screen(all = TRUE)
##D 
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


