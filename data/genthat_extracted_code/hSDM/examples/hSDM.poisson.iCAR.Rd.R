library(hSDM)


### Name: hSDM.poisson.iCAR
### Title: Poisson log regression model with CAR process
### Aliases: hSDM.poisson.iCAR
### Keywords: Poisson log regression biodiversity species distribution
###   models hierarchical Bayesian models spatial correlation intrinsic CAR
###   model conditional autoregressive model MCMC Markov Chains Monte Carlo
###   Metropolis algorithm

### ** Examples


## Not run: 
##D 
##D #==============================================
##D # hSDM.poisson.iCAR()
##D # Example with simulated data
##D #==============================================
##D 
##D #=================
##D #== Load libraries                          
##D library(hSDM)
##D library(raster)
##D library(sp)
##D 
##D #===================================
##D #== Multivariate normal distribution
##D rmvn <- function(n, mu = 0, V = matrix(1), seed=1234) {
##D     p <- length(mu)
##D     if (any(is.na(match(dim(V), p)))) {
##D         stop("Dimension problem!")
##D     }
##D     D <- chol(V)
##D     set.seed(seed)
##D     t(matrix(rnorm(n*p),ncol=p)%*%D+rep(mu,rep(n,p)))
##D }
##D 
##D #==================
##D #== Data simulation
##D 
##D #= Set seed for repeatability
##D seed <- 1234
##D 
##D #= Landscape
##D xLand <- 30
##D yLand <- 30 
##D Landscape <- raster(ncol=xLand,nrow=yLand,crs='+proj=utm +zone=1')
##D Landscape[] <- 0
##D extent(Landscape) <- c(0,xLand,0,yLand)
##D coords <- coordinates(Landscape)
##D ncells <- ncell(Landscape)
##D 
##D #= Neighbors
##D neighbors.mat <- adjacent(Landscape, cells=c(1:ncells), directions=8, pairs=TRUE, sorted=TRUE)
##D n.neighbors <- as.data.frame(table(as.factor(neighbors.mat[,1])))[,2]
##D adj <- neighbors.mat[,2]
##D 
##D #= Generate symmetric adjacency matrix, A
##D A <- matrix(0,ncells,ncells)
##D index.start <- 1
##D for (i in 1:ncells) {
##D     index.end <- index.start+n.neighbors[i]-1
##D     A[i,adj[c(index.start:index.end)]] <- 1
##D     index.start <- index.end+1
##D }
##D 
##D #= Spatial effects
##D Vrho.target <- 5
##D d <- 1	# Spatial dependence parameter = 1 for intrinsic CAR
##D Q <- diag(n.neighbors)-d*A + diag(.0001,ncells) # Add small constant to make Q non-singular
##D covrho <- Vrho.target*solve(Q) # Covariance of rhos
##D set.seed(seed)
##D rho <- c(rmvn(1,mu=rep(0,ncells),V=covrho,seed=seed)) # Spatial Random Effects
##D rho <- rho-mean(rho) # Centering rhos on zero
##D 
##D #= Raster and plot spatial effects
##D r.rho <- rasterFromXYZ(cbind(coords,rho))
##D plot(r.rho)
##D 
##D #= Sample the observation sites in the landscape
##D nsite <- 250
##D set.seed(seed)
##D x.coord <- runif(nsite,0,xLand)
##D set.seed(2*seed)
##D y.coord <- runif(nsite,0,yLand)
##D sites.sp <- SpatialPoints(coords=cbind(x.coord,y.coord))
##D cells <- extract(Landscape,sites.sp,cell=TRUE)[,1]
##D 
##D #= Ecological process (suitability)
##D set.seed(seed)
##D x1 <- rnorm(nsite,0,1)
##D set.seed(2*seed)
##D x2 <- rnorm(nsite,0,1)
##D X <- cbind(rep(1,nsite),x1,x2)
##D beta.target <- c(-1,1,-1)
##D log.lambda <- X %*% beta.target + rho[cells]
##D lambda <- exp(log.lambda)
##D set.seed(seed)
##D Y <- rpois(nsite,lambda)
##D 
##D #= Relative importance of spatial random effects
##D RImp <- mean(abs(rho[cells])/abs(X %*% beta.target))
##D RImp
##D 
##D #= Data-sets
##D data.obs <- data.frame(Y,x1,x2,cell=cells)
##D 
##D #==================================
##D #== Site-occupancy model
##D 
##D Start <- Sys.time() # Start the clock
##D mod.hSDM.poisson.iCAR <- hSDM.poisson.iCAR(counts=data.obs$Y,
##D                                            suitability=~x1+x2,
##D                                            spatial.entity=data.obs$cell,
##D                                            data=data.obs,
##D                                            n.neighbors=n.neighbors,
##D                                            neighbors=adj,
##D                                            suitability.pred=NULL,
##D                                            spatial.entity.pred=NULL,
##D                                            burnin=5000, mcmc=5000, thin=5,
##D                                            beta.start=0,
##D                                            Vrho.start=1,
##D                                            mubeta=0, Vbeta=1.0E6,
##D                                            priorVrho="1/Gamma",
##D                                            shape=0.5, rate=0.0005,
##D                                            seed=1234, verbose=1,
##D                                            save.rho=1, save.p=0)
##D Time.hSDM <- difftime(Sys.time(),Start,units="sec") # Time difference
##D 
##D #= Computation time
##D Time.hSDM
##D 
##D #==========
##D #== Outputs
##D 
##D #= Parameter estimates 
##D summary(mod.hSDM.poisson.iCAR$mcmc)
##D pdf("Posteriors_hSDM.poisson.iCAR.pdf")
##D plot(mod.hSDM.poisson.iCAR$mcmc)
##D dev.off()
##D 
##D #= Predictions
##D summary(mod.hSDM.poisson.iCAR$lambda.latent)
##D summary(mod.hSDM.poisson.iCAR$lambda.pred)
##D pdf(file="Pred-Init.pdf")
##D plot(lambda,mod.hSDM.poisson.iCAR$lambda.pred)
##D abline(a=0,b=1,col="red")
##D dev.off()
##D 
##D #= Summary plots for spatial random effects
##D 
##D # rho.pred
##D rho.pred <- apply(mod.hSDM.poisson.iCAR$rho.pred,2,mean)
##D r.rho.pred <- rasterFromXYZ(cbind(coords,rho.pred))
##D 
##D # plot
##D pdf(file="Summary_hSDM.poisson.iCAR.pdf")
##D par(mfrow=c(2,2))
##D # rho target
##D plot(r.rho, main="rho target")
##D plot(sites.sp,add=TRUE)
##D # rho estimated
##D plot(r.rho.pred, main="rho estimated")
##D # correlation and "shrinkage"
##D Levels.cells <- sort(unique(cells))
##D plot(rho[-Levels.cells],rho.pred[-Levels.cells],
##D      xlim=range(rho),
##D      ylim=range(rho),
##D      xlab="rho target",
##D      ylab="rho estimated")
##D points(rho[Levels.cells],rho.pred[Levels.cells],pch=16,col="blue")
##D legend(x=-3,y=4,legend="Visited cells",col="blue",pch=16,bty="n")
##D abline(a=0,b=1,col="red")
##D dev.off()
##D 
## End(Not run)




