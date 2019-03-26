library(rbugs)


### Name: rio
### Title: Dengue Fever in the State of Rio de Janeiro
### Aliases: rio
### Keywords: datasets

### ** Examples

data(rio)

## Not run: 
##D library(spdep)
##D rio.bug <- system.file("bugs/model/dengue.bug", package="rbugs")
##D 
##D ## Get the neighbor structure for Rio
##D rj.nb=poly2nb(rio)
##D  
##D ## Number of cases by county
##D Y = rio@data$Dengue
##D 
##D ## Get covariates
##D X <- as.matrix(rio@data[,c("Urban","Income")])
##D 
##D ## Get expected values
##D E <- rio@data$E
##D 
##D ## Number of covariates
##D P <- ncol(X)
##D 
##D ## Total counties
##D N <- length(rj.nb)
##D  
##D ## Number of neighbors of each county
##D num <- sapply(rj.nb, length)
##D  
##D ## Adjacency neighbor list of each county
##D adj <- unlist(rj.nb)
##D 
##D ## Total sum of the number of neighbors in the map
##D sumNumNeigh <- length(adj)
##D  
##D ## Set data file
##D data.rio <- list (N=N, P=P, Y=Y, adj=adj, X=X, E=E, num=num, sumNumNeigh=sumNumNeigh)
##D 
##D ## Generate the intial values for spatial vector (u), random noise (v) and covariates effects (beta)
##D u.aux <- rep(0,N)
##D v.aux <- rep(0,N)
##D beta.aux <- rep(0,P)
##D 
##D ## Generate the list with the nescessary information in the init file
##D inits <- list( list(beta = beta.aux, tau.u = 1, tau.v = 1, u=u.aux, v=v.aux, Int=0.0))
##D 
##D ## Set the parameters that will be saved and returned by BUGS
##D parameters <- c("beta", "tau.u", "tau.v", "RR", "Int")
##D 
##D ## no tested examples for mac-os.
##D 
##D rio.sim <- rbugs(data.rio, inits, parameters,
##D                  rio.bug, n.chains=2, n.iter=60000, 
##D                  n.burnin = 10000, n.thin = 10, 
##D                  bugs="/usr/bin/OpenBUGS",
##D                  bugsWorkingDir="/home/marcos/tmp")
##D 
##D ## MCMC analysis
##D library("coda")
##D rio.mcmc <- rbugs2coda(rio.sim)
##D summary(rio.mcmc)
##D effectiveSize(rio.mcmc)
##D gelman.diag(rio.mcmc)
##D 
##D 
## End(Not run)



