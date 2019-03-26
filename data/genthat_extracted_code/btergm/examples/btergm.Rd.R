library(btergm)


### Name: btergm
### Title: TERGM by bootstrapped pseudolikelihood or MCMC MLE
### Aliases: btergm mtergm tergm

### ** Examples

# A simple toy example:

library("network")
set.seed(5)

networks <- list()
for(i in 1:10){            # create 10 random networks with 10 actors
  mat <- matrix(rbinom(100, 1, .25), nrow = 10, ncol = 10)
  diag(mat) <- 0           # loops are excluded
  nw <- network(mat)       # create network object
  networks[[i]] <- nw      # add network to the list
}

covariates <- list()
for (i in 1:10) {          # create 10 matrices as covariate
  mat <- matrix(rnorm(100), nrow = 10, ncol = 10)
  covariates[[i]] <- mat   # add matrix to the list
}

fit <- btergm(networks ~ edges + istar(2) +
    edgecov(covariates), R = 100)

summary(fit)               # show estimation results

## Not run: 
##D # The same example using MCMC MLE:
##D 
##D fit2 <- mtergm(networks ~ edges + istar(2) + 
##D     edgecov(covariates))
##D 
##D summary(fit2)
## End(Not run)

# For examples with real data, see help("knecht") or help("alliances").


# Examples for parallel processing:

# Some preliminaries: 
# - "Forking" means running the code on multiple cores in the same 
#   computer. It's fast but consumes a lot of memory because all 
#   objects are copied for each node. It's also restricted to 
#   cores within a physical computer, i.e. no distribution over a 
#   network or cluster. Forking does not work on Windows systems.
# - "MPI" is a protocol for distributing computations over many 
#   cores, often across multiple physical computers/nodes. MPI 
#   is fast and can distribute the work across hundreds of nodes 
#   (but remember that R can handle a maximum of 128 connections, 
#   which includes file access and parallel connections). However, 
#   it requires that the Rmpi package is installed and that an MPI 
#   server is running (e.g., OpenMPI).
# - "PSOCK" is a TCP-based protocol. It can also distribute the 
#   work to many cores across nodes (like MPI). The advantage of 
#   PSOCK is that it can as well make use of multiple nodes within 
#   the same node or desktop computer (as with forking) but without 
#   consuming too much additional memory. However, the drawback is 
#   that it is not as fast as MPI or forking.
# The following code provides examples for these three scenarios.

# btergm works with clusters via the parallel package. That is, the 
# user can create a cluster object (of type "PSOCK", "MPI", or 
# "FORK") and supply it to the 'cl' argument of the 'btergm' 
# function. If no cluster object is provided, btergm will try to 
# create a temporary PSOCK cluster (if parallel = "snow") or it 
# will use forking (if parallel = "multicore").

## Not run: 
##D 
##D # To use a PSOCK cluster without providing an explicit cluster 
##D # object:
##D require("parallel")
##D fit <- btergm(networks ~ edges + istar(2) + edgecov(covariates), 
##D     R = 100, parallel = "snow", ncpus = 25)
##D 
##D # Equivalently, a PSOCK cluster can be provided as follows:
##D require("parallel")
##D cores <- 25
##D cl <- makeCluster(cores, type = "PSOCK")
##D fit <- btergm(networks ~ edges + istar(2) + edgecov(covariates), 
##D     R = 100, parallel = "snow", ncpus = cores, cl = cl)
##D stopCluster(cl)
##D 
##D # Forking (without supplying a cluster object) can be used as 
##D # follows.
##D require("parallel")
##D cores <- 25
##D fit <- btergm(networks ~ edges + istar(2) + edgecov(covariates), 
##D     R = 100, parallel = "multicore", ncpus = cores)
##D stopCluster(cl)
##D 
##D # Forking (by providing a cluster object) works as follows:
##D require("parallel")
##D cores <- 25
##D cl <- makeCluster(cores, type = "FORK")
##D fit <- btergm(networks ~ edges + istar(2) + edgecov(covariates), 
##D     R = 100, parallel = "snow", ncpus = cores, cl = cl)
##D stopCluster(cl)
##D 
##D # To use MPI, a cluster object MUST be created beforehand. In 
##D # this example, a MOAB HPC server is used. It stores the number of 
##D # available cores as a system option:
##D require("parallel")
##D cores <- as.numeric(Sys.getenv("MOAB_PROCCOUNT"))
##D cl <- makeCluster(cores, type = "MPI")
##D fit <- btergm(networks ~ edges + istar(2) + edgecov(covariates), 
##D     R = 100, parallel = "snow", ncpus = cores, cl = cl)
##D stopCluster(cl)
##D 
##D # In the following example, the Rmpi package is used to create a 
##D # cluster. This may not work on all systems; consult your local 
##D # support staff or the help files on your HPC server to find out how 
##D # to create a cluster object on your system.
##D 
##D # snow/Rmpi start-up
##D if (!is.loaded("mpi_initialize")) {
##D     library("Rmpi")
##D }
##D library(snow);
##D 
##D mpirank <- mpi.comm.rank (0)
##D if (mpirank == 0) {
##D    invisible(makeMPIcluster())
##D } else {
##D   sink (file="/dev/null")
##D   invisible(slaveLoop (makeMPImaster()))
##D   mpi.finalize()
##D   q()
##D }
##D # End snow/Rmpi start-up
##D 
##D cl <- getMPIcluster()
##D 
##D fit <- btergm(networks ~ edges + istar(2) + edgecov(covariates), 
##D     R = 100, parallel = "snow", ncpus = 25, cl = cl)
## End(Not run)




