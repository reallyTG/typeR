library(EpiILMCT)


### Name: epictmcmc
### Title: Markov Chain Monte Carlo-based tool for analyzing (SIR/SINR)
###   distance-based/network-based individual-level disease data.
### Aliases: epictmcmc
### Keywords: Bayesian Inference

### ** Examples

## Not run: 
##D 	
##D ## distance-based SIR continuous-time ILMs ##
##D data(SpatialData)
##D ## performing the MCMC-tool for analyzing the fully observed spatial data 
##D ## under the SIR distance-based continuous ILM:
##D mcmcres2 <- epictmcmc(epidat = SpatialData$epi, type = "SIR", kerneltype = "distance",  
##D kernelmatrix = SpatialData$dis, 
##D distancekernel = "powerlaw", datatype = "known epidemic", nsim = 10000, 
##D sus.par = c(2, "gamma", 1, 0.01, 0.5), 
##D kernel.par = c(2, "gamma", 1, 0.01, 0.5),  seedval  =  524837)
##D 
##D ## performing the MCMC-tool for analyzing the partially observed spatial data
##D ## (unknown infection times) under the SIR distance-based continuous ILM:
##D mcmcres22 <- epictmcmc(epidat = SpatialData$epi, type = "SIR", kerneltype = "distance", 
##D kernelmatrix = SpatialData$dis, distancekernel = "powerlaw", 
##D datatype = "known removal", nsim = 50000,  sus.par = c(2, "gamma", 1, 0.01, 0.8), 
##D kernel.par = c(2, "gamma", 1, 0.01, 0.5), delta = c(1, 2, 4, 2),  seedval  =  524837)
##D 
##D ## distance-based and network-based SIR ILMs ##
##D data(SpatialNetData)
##D ## performing the MCMC-tool for analyzing the fully observed spatial and network data
##D ## under the SIR distance-based and network-based continuous-time ILM:
##D mcmcres3 <- epictmcmc(epidat = SpatialNetData$epi, type = "SIR", kerneltype = "both", 
##D kernelmatrix = list(SpatialNetData$dis, SpatialNetData$net), 
##D distancekernel = "powerlaw", datatype = "known epidemic", nsim = 10000, 
##D sus.par = matrix(c(0.08, 0.2, "gamma", "gamma", 1, 1, 0.01, 0.01, 0.1, 0.5), ncol = 5, nrow = 2), 
##D kernel.par = matrix(c(5, 0.5, "gamma", "gamma", 1, 1, 0.01, 0.01, 0.5, 1), ncol = 5, nrow = 2), 
##D suscov = SpatialNetData$cov,  seedval  =  524837)
##D 
##D ## network-based SIR ILMs ##
##D data(NetworkData)
##D ## performing the MCMC-tool for analyzing the fully observed network data 
##D ## under the SIR network-based continuous-time ILM:
##D mcmcres4 <- epictmcmc(epidat = NetworkData$epi, type = "SIR", kerneltype = "network", 
##D kernelmatrix =  NetworkData$net, datatype = "known epidemic", nsim = 10000, 
##D sus.par = matrix(c(0.08, 0.5, "gamma", "gamma", 1, 1, 1, 1, 0.1, 0.5), ncol = 5, nrow = 2), 
##D suscov = NetworkData$cov,  seedval  =  524837)
##D 
##D ## network-based SINR ILMs ##
##D data(NetworkDataSINR)
##D ## performing the MCMC-tool for analyzing the fully observed network data
##D ## under the SINR network-based continuous-time ILM:
##D mcmcres5 <- epictmcmc(epidat = NetworkDataSINR$epi, type = "SINR", kerneltype = "network", 
##D kernelmatrix = NetworkDataSINR$net, datatype = "known epidemic", nsim = 10000, 
##D sus.par = matrix(c(0.08, 0.2, "gamma", "gamma", 1, 1, 0.01, 0.01, 0.05, 0.5), ncol = 5, nrow = 2), 
##D suscov =  NetworkDataSINR$cov,  seedval  =  524837)
## End(Not run)



