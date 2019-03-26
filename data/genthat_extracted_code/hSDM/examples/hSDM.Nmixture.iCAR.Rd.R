library(hSDM)


### Name: hSDM.Nmixture.iCAR
### Title: N-mixture model with CAR process
### Aliases: hSDM.Nmixture.iCAR
### Keywords: biodiversity species distribution models hierarchical
###   Bayesian models N-mixture models spatial correlation intrinsic CAR
###   model conditional autoregressive model MCMC Markov Chains Monte Carlo
###   Metropolis algorithm

### ** Examples


## Not run: 
##D 
##D #==============================================
##D # hSDM.Nmixture.iCAR()
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
##D 
##D #==================
##D #== Data simulation
##D 
##D #= Set seed for repeatability
##D seed <- 4321
##D 
##D #= Landscape
##D xLand <- 20
##D yLand <- 20 
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
##D nsite <- 150
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
##D N <- rpois(nsite,lambda)
##D 
##D #= Relative importance of spatial random effects
##D RImp <- mean(abs(rho[cells])/abs(X %*% beta.target))
##D RImp
##D 
##D #= Number of visits associated to each observation point
##D set.seed(seed)
##D visits <- rpois(nsite,3)
##D visits[visits==0] <- 1
##D # Vector of observation points
##D sites <- vector()
##D for (i in 1:nsite) {
##D     sites <- c(sites,rep(i,visits[i]))
##D }
##D 
##D #= Observation process (detectability)
##D nobs <- sum(visits)
##D set.seed(seed)
##D w1 <- rnorm(nobs,0,1)
##D set.seed(2*seed)
##D w2 <- rnorm(nobs,0,1)
##D W <- cbind(rep(1,nobs),w1,w2)
##D gamma.target <- c(-1,1,-1)
##D logit.delta <- W %*% gamma.target
##D delta <- inv.logit(logit.delta)
##D set.seed(seed)
##D Y <- rbinom(nobs,N[sites],delta)
##D 
##D #= Data-sets
##D data.obs <- data.frame(Y,w1,w2,site=sites)
##D data.suit <- data.frame(x1,x2,cell=cells)
##D 
##D #================================
##D #== Parameter inference with hSDM
##D 
##D Start <- Sys.time() # Start the clock
##D mod.hSDM.Nmixture.iCAR <- hSDM.Nmixture.iCAR(# Observations
##D                            counts=data.obs$Y,
##D                            observability=~w1+w2,
##D                            site=data.obs$site,
##D                            data.observability=data.obs,
##D                            # Habitat
##D                            suitability=~x1+x2, data.suitability=data.suit,
##D                            # Spatial structure
##D                            spatial.entity=data.suit$cell,
##D                            n.neighbors=n.neighbors, neighbors=adj,
##D                            # Predictions
##D                            suitability.pred=NULL,
##D                            spatial.entity.pred=NULL,
##D                            # Chains
##D                            burnin=5000, mcmc=5000, thin=5,
##D                            # Starting values
##D                            beta.start=0,
##D                            gamma.start=0,
##D                            Vrho.start=1,
##D                            # Priors
##D                            mubeta=0, Vbeta=1.0E6,
##D                            mugamma=0, Vgamma=1.0E6,
##D                            priorVrho="1/Gamma",
##D                            shape=0.5, rate=0.005,
##D                            Vrho.max=10,
##D                            # Various
##D                            seed=1234, verbose=1,
##D                            save.rho=1, save.p=0, save.N=1)
##D Time.hSDM <- difftime(Sys.time(),Start,units="sec") # Time difference
##D 
##D #= Computation time
##D Time.hSDM
##D 
##D #==========
##D #== Outputs
##D 
##D #= Parameter estimates 
##D summary(mod.hSDM.Nmixture.iCAR$mcmc)
##D pdf(file="Posteriors_hSDM.Nmixture.iCAR.pdf")
##D plot(mod.hSDM.Nmixture.iCAR$mcmc)
##D dev.off()
##D 
##D #= Predictions
##D summary(mod.hSDM.Nmixture.iCAR$lambda.latent)
##D summary(mod.hSDM.Nmixture.iCAR$delta.latent)
##D summary(mod.hSDM.Nmixture.iCAR$lambda.pred)
##D pdf(file="Pred-Init.pdf")
##D plot(lambda,mod.hSDM.Nmixture.iCAR$lambda.pred)
##D abline(a=0,b=1,col="red")
##D dev.off()
##D 
##D #= MCMC for latent variable N
##D pdf(file="MCMC_N.pdf")
##D plot(mod.hSDM.Nmixture.iCAR$N.pred)
##D dev.off()
##D 
##D #= Check that Ns are corretly estimated
##D M <- as.matrix(mod.hSDM.Nmixture.iCAR$N.pred)
##D N.est <- apply(M,2,mean)
##D Y.by.site <- tapply(data.obs$Y,data.obs$site,mean) # Mean by site
##D pdf(file="Check_N.pdf",width=10,height=5)
##D par(mfrow=c(1,2))
##D plot(Y.by.site, N.est) ## More individuals are expected (N > Y) due to detection process
##D abline(a=0,b=1,col="red")
##D plot(N, N.est) ## N are well estimated
##D abline(a=0,b=1,col="red")
##D cor(N, N.est) ## Very close to 1
##D dev.off()
##D 
##D #= Summary plots for spatial random effects
##D 
##D # rho.pred
##D rho.pred <- apply(mod.hSDM.Nmixture.iCAR$rho.pred,2,mean)
##D r.rho.pred <- rasterFromXYZ(cbind(coords,rho.pred))
##D 
##D # plot
##D pdf(file="Summary_hSDM.Nmixture.iCAR.pdf")
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




