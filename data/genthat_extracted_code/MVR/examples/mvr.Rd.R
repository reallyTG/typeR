library(MVR)


### Name: mvr
### Title: Function for Mean-Variance Regularization and Variance
###   Stabilization
### Aliases: mvr
### Keywords: Mean-Variance Estimators Regularization Variance
###   Stabilization Normalization Parallel Programming High Performance
###   Computing

### ** Examples

#===================================================
# Loading the library and its dependencies
#===================================================
library("MVR")

## Not run: 
##D     #===================================================
##D     # MVR package news
##D     #===================================================
##D     MVR.news()
##D 
##D     #================================================
##D     # MVR package citation
##D     #================================================
##D     citation("MVR")
##D 
##D     #===================================================
##D     # Loading of the Synthetic and Real datasets
##D     # Use help for descriptions
##D     #===================================================
##D     data("Synthetic", "Real", package="MVR")
##D     ?Synthetic
##D     ?Real
## End(Not run)

#===================================================
# Mean-Variance Regularization (Synthetic dataset)
# Single-Group Assumption
# Assuming equal variance between groups
# Without cluster usage
#===================================================
nc.min <- 1
nc.max <- 10
probs <- seq(0, 1, 0.01)
n <- 10
mvr.obj <- mvr(data = Synthetic,
               block = rep(1,n),
               tolog = FALSE,
               nc.min = nc.min,
               nc.max = nc.max,
               probs = probs,
               B = 100,
               parallel = FALSE,
               conf = NULL,
               verbose = TRUE,
               seed = 1234)

## Not run: 
##D     #===================================================
##D     # Examples of parallel backend parametrization 
##D     #===================================================
##D     if (require("parallel")) {
##D        print("'parallel' is attached correctly \n")
##D     } else {
##D        stop("'parallel' must be attached first \n")
##D     }
##D     #===================================================
##D     # Ex. #1 - Multicore PC
##D     # Running WINDOWS
##D     # SOCKET communication cluster
##D     # Shared memory parallelization
##D     #===================================================
##D     cpus <- detectCores(logical = TRUE)
##D     conf <- list("spec" = rep("localhost", cpus),
##D                  "type" = "SOCKET",
##D                  "homo" = TRUE,
##D                  "verbose" = TRUE,
##D                  "outfile" = "")
##D     #===================================================
##D     # Ex. #2 - Master node + 3 Worker nodes cluster
##D     # All nodes equipped with identical setups of multicores 
##D     # (8 core CPUs per machine for a total of 32)
##D     # SOCKET communication cluster
##D     # Distributed memory parallelization
##D     #===================================================
##D     masterhost <- Sys.getenv("HOSTNAME")
##D     slavehosts <- c("compute-0-0", "compute-0-1", "compute-0-2")
##D     nodes <- length(slavehosts) + 1
##D     cpus <- 8
##D     conf <- list("spec" = c(rep(masterhost, cpus),
##D                             rep(slavehosts, cpus)),
##D                  "type" = "SOCKETs",
##D                  "homo" = TRUE,
##D                  "verbose" = TRUE,
##D                  "outfile" = "")
##D     #===================================================
##D     # Ex. #3 - Enterprise Multinode Cluster w/ multicore/node  
##D     # Running LINUX with SLURM scheduler
##D     # MPI communication cluster
##D     # Distributed memory parallelisation
##D     #==================================================
##D     if (require("Rmpi")) {
##D         print("'Rmpi' is attached correctly \n")
##D     } else {
##D         stop("'Rmpi' must be attached first \n")
##D     }
##D     # Below, variable 'cpus' is the total number of requested 
##D     # taks (threads/CPUs), which is specified from within a 
##D     # SLURM script.
##D     cpus <- as.numeric(Sys.getenv("SLURM_NTASKS"))
##D     conf <- list("spec" = cpus,
##D                  "type" = "MPI",
##D                  "homo" = TRUE,
##D                  "verbose" = TRUE,
##D                  "outfile" = "")
##D     #===================================================
##D     # Mean-Variance Regularization (Real dataset)
##D     # Multi-Group Assumption
##D     # Assuming unequal variance between groups
##D     #===================================================
##D     nc.min <- 1
##D     nc.max <- 30
##D     probs <- seq(0, 1, 0.01)
##D     n <- 6
##D     GF <- factor(gl(n = 2, k = n/2, length = n),
##D                  ordered = FALSE,
##D                  labels = c("M", "S"))
##D     mvr.obj <- mvr(data = Real,
##D                    block = GF,
##D                    tolog = FALSE,
##D                    nc.min = nc.min,
##D                    nc.max = nc.max,
##D                    probs = probs,
##D                    B = 100,
##D                    parallel = TRUE,
##D                    conf = conf,
##D                    verbose = TRUE,
##D                    seed = 1234)
##D     
## End(Not run)



