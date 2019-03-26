library(hSDM)


### Name: hSDM.ZIB.iCAR.alteration
### Title: ZIB (Zero-Inflated Binomial) model with CAR process taking into
###   account site alteration
### Aliases: hSDM.ZIB.iCAR.alteration
### Keywords: biodiversity species distribution models hierarchical
###   Bayesian models spatial correlation intrinsic CAR model conditional
###   autoregressive model MCMC Markov Chains Monte Carlo Metropolis
###   algorithm ZIB models Zero-Inflated Binomial models

### ** Examples


## Not run: 
##D  
##D 
##D #==============================================
##D # hSDM.ZIB.iCAR.alteration()
##D # Example with simulated data
##D #==============================================
##D 
##D #============
##D #== Preambule
##D library(hSDM)
##D library(raster)
##D library(sp)
##D library(mvtnorm)
##D 
##D #==================
##D #== Data simulation
##D 
##D # Set seed for repeatability
##D seed <- 1234
##D 
##D # Target parameters
##D beta.target <- matrix(c(0.2,0.5,0.5),ncol=1)
##D gamma.target <- matrix(c(1),ncol=1)
##D ## Uncomment if you want covariates on the observability process
##D ## gamma.target <- matrix(c(0.2,0.5,0.5),ncol=1)
##D Vrho.target <- 1 # Spatial Variance
##D 
##D # Landscape
##D Landscape <- raster(ncol=20,nrow=20,crs='+proj=utm +zone=1')
##D ncell <- ncell(Landscape)
##D 
##D # Neighbors
##D neighbors.mat <- adjacent(Landscape, cells=c(1:ncell), directions=8, pairs=TRUE, sorted=TRUE)
##D n.neighbors <- as.data.frame(table(as.factor(neighbors.mat[,1])))[,2]
##D adj <- neighbors.mat[,2]
##D 
##D # Generate symmetric adjacency matrix, A
##D A <- matrix(0,ncell,ncell)
##D index.start <- 1
##D for (i in 1:ncell) {
##D     index.end <- index.start+n.neighbors[i]-1
##D     A[i,adj[c(index.start:index.end)]] <- 1
##D     index.start <- index.end+1
##D }
##D 
##D # Spatial effects
##D d <- 1	# Spatial dependence parameter = 1 for intrinsic CAR
##D Q <- diag(n.neighbors)-d*A + diag(.0001,ncell) # Add small constant to make Q non-singular
##D covrho <- Vrho.target*solve(Q) # Covariance of rhos
##D set.seed(seed)
##D rho <- c(rmvnorm(1,sigma=covrho)) # Spatial Random Effects
##D rho <- rho-mean(rho) # Centering rhos on zero
##D 
##D # Visited cells
##D n.visited <- 150 # Compare with 400, 350 and 100 for example
##D set.seed(seed)
##D visited.cells <- sort(sample(1:ncell,n.visited,replace=FALSE)) # Draw visited cells at random
##D notvisited.cells <- c(1:ncell)[-visited.cells]
##D 
##D # Number of observations
##D nobs <- 300
##D 
##D # Cell vector
##D set.seed(seed)
##D cells <- c(visited.cells,sample(visited.cells,nobs-n.visited,replace=TRUE))
##D coords <- xyFromCell(Landscape,cells) # Get coordinates
##D 
##D # Covariates for "suitability" process
##D set.seed(seed)
##D X1.cell <- rnorm(n=ncell,0,1)
##D set.seed(2*seed)
##D X2.cell <- rnorm(n=ncell,0,1)
##D X1 <- X1.cell[cells]
##D X2 <- X2.cell[cells]
##D X <- cbind(rep(1,nobs),X1,X2)
##D 
##D # Alteration
##D U <- runif(n=nobs,min=0,max=1)
##D 
##D # Covariates for "observability" process
##D W <- cbind(rep(1,nobs))
##D ## Uncomment if you want covariates on the observability process 
##D ## set.seed(3*seed)
##D ## W1 <- rnorm(n=nobs,0,1)
##D ## set.seed(4*seed)
##D ## W2 <- rnorm(n=nobs,0,1)
##D ## W <- cbind(rep(1,nobs),W1,W2)
##D 
##D #== Simulating latent variables
##D 
##D # Suitability
##D logit.theta.1 <- vector()
##D for (n in 1:nobs) {
##D   logit.theta.1[n] <- X[n,]%*%beta.target+rho[cells[n]]
##D }
##D theta.1 <- inv.logit(logit.theta.1)
##D set.seed(seed)
##D y.1 <- rbinom(nobs,1,theta.1)
##D 
##D # Alteration
##D u <- rbinom(nobs,1,U)
##D 
##D # Observability
##D set.seed(seed)
##D trials <- rpois(nobs,5)	# Number of trial associated to each observation
##D trials[trials==0] <- 1
##D logit.theta.2 <- W%*%gamma.target
##D theta.2 <- inv.logit(logit.theta.2)
##D set.seed(seed)
##D y.2 <- rbinom(nobs,trials,theta.2)
##D 
##D #== Simulating response variable
##D Y <- y.2*(1-u)*y.1
##D 
##D #== Data-set
##D Data <- data.frame(Y,trials,cells,X1,X2,U)
##D ## Uncomment if you want covariates on the observability process 
##D ## Data <- data.frame(Y,trials,cells,X1,X2,W1,W2,U)
##D Data <- SpatialPointsDataFrame(coords=coords,data=Data)
##D plot(Data)
##D 
##D #== Data-set for predictions (suitability on each spatial cell)
##D Data.pred <- data.frame(X1=X1.cell,X2=X2.cell,cells=c(1:ncell))
##D 
##D #==================================
##D #== Site-occupancy model
##D 
##D mod.hSDM.ZIB.iCAR.alteration <- hSDM.ZIB.iCAR.alteration(presences=Data$Y,
##D                                                trials=Data$trials,
##D                                                suitability=~X1+X2,
##D                                                observability=~1,
##D                                                spatial.entity=Data$cells,
##D                                                alteration=Data$U,
##D                                                data=Data,
##D                                                n.neighbors=n.neighbors,
##D                                                neighbors=adj,
##D                                                ## suitability.pred=NULL,
##D                                                ## spatial.entity.pred=NULL,
##D                                                suitability.pred=Data.pred,
##D                                                spatial.entity.pred=Data.pred$cells,
##D                                                burnin=5000, mcmc=5000, thin=5,
##D                                                beta.start=0,
##D                                                gamma.start=0,
##D                                                Vrho.start=10,
##D                                                priorVrho="1/Gamma",
##D                                                #priorVrho="Uniform",
##D                                                #priorVrho=10,
##D                                                mubeta=0, Vbeta=1.0E6,
##D                                                mugamma=0, Vgamma=1.0E6,
##D                                                shape=0.5, rate=0.0005,
##D                                                #Vrho.max=1000,
##D                                                seed=1234, verbose=1,
##D                                                save.rho=1, save.p=0)
##D 
##D #==========
##D #== Outputs
##D 
##D #= Parameter estimates
##D summary(mod.hSDM.ZIB.iCAR.alteration$mcmc)
##D 
##D #= MCMC and posteriors
##D pdf(file="Posteriors_hSDM.ZIB.iCAR.alteration.pdf")
##D plot(mod.hSDM.ZIB.iCAR.alteration$mcmc)
##D dev.off()
##D 
##D pdf(file="Posteriors.rho_hSDM.ZIB.iCAR.alteration.pdf")
##D plot(mod.hSDM.ZIB.iCAR.alteration$rho.pred)
##D dev.off()
##D 
##D #= Summary plots
##D 
##D # rho
##D r.rho <- r.rho.pred <- r.visited <- Landscape
##D r.rho[] <- rho
##D rho.pred <- apply(mod.hSDM.ZIB.iCAR.alteration$rho.pred,2,mean)
##D r.rho.pred[] <- rho.pred
##D r.visited[] <- 0
##D r.visited[visited.cells] <- 1
##D # prob.p
##D r.prob.p <- Landscape
##D r.prob.p[] <- mod.hSDM.ZIB.iCAR.alteration$prob.p.pred
##D 
##D pdf(file="Summary_hSDM.ZIB.iCAR.alteration.pdf")
##D par(mfrow=c(3,2))
##D plot(r.rho, main="rho target")
##D plot(r.visited,main="Visited cells and presences")
##D plot(Data[Y>0,],add=TRUE,pch=16,cex=0.5)
##D plot(r.rho.pred, main="rho estimated")
##D plot(rho[visited.cells],rho.pred[visited.cells],
##D      xlab="rho target",
##D      ylab="rho estimated")
##D points(rho[notvisited.cells],rho.pred[notvisited.cells],pch=16,col="blue")
##D legend(x=-4,y=3.5,legend="Unvisited cells",col="blue",pch=16,bty="n")
##D abline(a=0,b=1,col="red")
##D plot(r.prob.p,main="Proba of presence")
##D plot(Data[Y>0,],add=TRUE,pch=16,cex=0.5)
##D dev.off()
##D 
## End(Not run)




