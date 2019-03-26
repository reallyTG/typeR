library(hsdar)


### Name: hsdar_parallel
### Title: hsdar_parallel
### Aliases: hsdar_parallel
### Keywords: utilities

### ** Examples

## Not run: 
##D supported_functions <- hsdar_parallel()
##D supported_functions
##D 
##D data(spectral_data)
##D 
##D ## Example for Windows and other systems where doMPI is available
##D ## Load library
##D library(doMPI)
##D ## Register number of workers
##D cl <- startMPIcluster(count = 3)
##D registerDoMPI(cl)
##D 
##D ## Transform speclib using 3 cores
##D bd <- transformSpeclib(spectral_data)
##D 
##D ## Close the cluster (important to get rid of processes)
##D closeCluster(cl)
##D 
##D ## Example for Linux and other systems where doMC is available
##D ## Load library
##D library(doMC)
##D ## Register number of workers
##D registerDoMC(3)
##D 
##D ## Transform speclib using 3 cores
##D bd <- transformSpeclib(spectral_data)
## End(Not run)



