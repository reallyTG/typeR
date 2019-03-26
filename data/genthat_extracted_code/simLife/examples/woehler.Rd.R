library(simLife)


### Name: woehler
### Title: Woehler experiment
### Aliases: woehler

### ** Examples

## Not run: 
##D 
##D ## Unless MS-Windows
##D # library(parallel)
##D # options(simLife.mc=2L)
##D 
##D # primary particles and secondary phase (ferrit) 
##D # which is already clustered and densified 
##D data(AL2MC_20p_k10_F2p_S)	
##D 
##D # simulation parameters 
##D opt <- list("vickers"=107,"distTol"=1.0,"Tmax"=10^11,
##D 			"inAreafactor"=1.56, "outAreafactor"=1.43,
##D 			"pointsConvHull"=10, "scale"=1e+06,"pl"=1L)
##D 
##D # lifetimes parameters
##D par <- list("P"=c(0.01,6,0.5,75,-15,1.5),
##D 			"F"=c(0,0,0,105,-12,1),
##D 			"const"=NULL)
##D 	
##D nsim <- 10
##D stress <- as.list(seq(from=90,to=140,by=10))
##D 
##D cl <- NULL
##D ## MPI/SOCKS/PSOCKS cluster object (even on Windows)
##D ## must initialize RNG stream (rlecuyer) for reproducible results
##D # RNGkind("L'Ecuyer-CMRG")
##D # cl <- makeCluster(8)
##D # clusterSetRNGStream(cl)
##D 	
##D # the following code may take some time
##D W <- woehler(S, CL=NULL, par, opt, stress=rep(stress,each=nsim),cores=1L,cl=cl)
##D woehlerDiagram(W, yrange=c(70,145))
##D 
##D ## do not forget to stop cluster if used 
##D if(!is.null(cl)) stopCluster(cl)	
## End(Not run)



