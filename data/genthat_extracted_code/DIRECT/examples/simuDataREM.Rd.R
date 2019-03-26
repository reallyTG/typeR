library(DIRECT)


### Name: simuDataREM
### Title: Data Simulation Under the Random-Effects Mixture Model
### Aliases: simuDataREM

### ** Examples

## Not run: 
##D # Simulate replicated time-course gene expression profiles
##D # from OU processes
##D 
##D # Simulation parameters
##D times = c(0,5,10,15,20,25,30,35,40,50,60,70,80,90,100,110,120,150)
##D ntime=length (times)
##D nrep=4
##D 
##D nclust = 6
##D npars = 8
##D pars.mtx = matrix (0, nrow=nclust, ncol=npars)
##D # late weak upregulation or downregulation
##D pars.mtx[1,] = c(0.05, 0.1, 0.5, 0, 0.16, 0.1, 0.4, 0.05)		
##D # repression
##D pars.mtx[2,] = c(0.05, 0.1, 0.5, 1, 0.16, -1.0, 0.1, 0.05)	        
##D # early strong upregulation
##D pars.mtx[3,] = c(0.05, 0.5, 0.2, 0, 0.16, 2.5, 0.4, 0.15)	        
##D # strong repression
##D pars.mtx[4,] = c(0.05, 0.5, 0.2, 1, 0.16, -1.5, 0.4, 0.1)	        
##D # low upregulation
##D pars.mtx[5,] = c(0.05, 0.3, 0.3, -0.5, 0.16, 0.5, 0.2, 0.08)		
##D # late strong upregulation
##D pars.mtx[6,] = c(0.05, 0.3, 0.3, -0.5, 0.16, 0.1, 1, 0.1)	        
##D 
##D nsize = rep(40, nclust)
##D 
##D # Generate data
##D simudata = simuDataREM (pars=pars.mtx, dt=1, T=150, 
##D     ntime=ntime, nrep=nrep, nsize=nsize, times=times, method="svd", model="OU")
##D 
##D # Display simulated data
##D plotSimulation (simudata, times=times, 
##D     nsize=nsize, nrep=nrep, lty=1, ylim=c(-4,4), type="l", col="black")
##D 
##D # Write simulation parameters and simulated data
##D # to external files
##D outputData (datafilename= "simu_test.dat", parfilename= "simu_test.par", 
##D     meanfilename= "simu_test_mean.dat", simudata=simudata, pars=pars.mtx, 
##D     nitem=sum(nsize), ntime=ntime, nrep=nrep)
## End(Not run)



