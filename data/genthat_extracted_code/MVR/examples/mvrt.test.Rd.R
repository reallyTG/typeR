library(MVR)


### Name: mvrt.test
### Title: Function for Computing Mean-Variance Regularized T-test
###   Statistic and Its Significance
### Aliases: mvrt.test
### Keywords: Mean-Variance Estimators Regularized Test Statistics Parallel
###   Programming High Performance Computing

### ** Examples

#================================================
# Loading the library and its dependencies
#================================================
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

#================================================
# Regularized t-test statistics (Synthetic dataset) 
# Multi-Group Assumption
# Assuming unequal variance between groups
# With option to use prior MVR clustering results
# Without computation of p-values
# Without cluster usage
#================================================
nc.min <- 1
nc.max <- 10
probs <- seq(0, 1, 0.01)
n <- 10
GF <- factor(gl(n = 2, k = n/2, length = n), 
             ordered = FALSE, 
             labels = c("G1", "G2"))
mvr.obj <- mvr(data = Synthetic, 
               block = GF, 
               tolog = FALSE, 
               nc.min = nc.min, 
               nc.max = nc.max, 
               probs = probs,
               B = 100,
               parallel = FALSE, 
               conf = NULL,
               verbose = TRUE,
               seed = 1234)
mvrt.obj <- mvrt.test(data = NULL,
                      obj = mvr.obj,
                      block = NULL,
                      pval = FALSE,
                      replace = FALSE,
                      n.resamp = 100,
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
##D     # Example #1 - Quad core PC 
##D     # Running WINDOWS with SOCKET communication
##D     #===================================================
##D     cpus <- parallel::detectCores(logical = TRUE)
##D     conf <- list("spec" = rep("localhost", cpus),
##D                  "type" = "SOCKET",
##D                  "homo" = TRUE,
##D                  "verbose" = TRUE,
##D                  "outfile" = "")
##D     #===================================================
##D     # Example #2 - Master node + 3 Worker nodes cluster
##D     # Running LINUX with SOCKET communication
##D     # All nodes equipped with identical setups of 
##D     # multicores (8 core CPUs per machine for a total of 32)
##D     #===================================================
##D     masterhost <- Sys.getenv("HOSTNAME")
##D     slavehosts <- c("compute-0-0", "compute-0-1", "compute-0-2")
##D     nodes <- length(slavehosts) + 1
##D     cpus <- 8
##D     conf <- list("spec" = c(rep(masterhost, cpus),
##D                             rep(slavehosts, cpus)),
##D                  "type" = "SOCKET",
##D                  "homo" = TRUE,
##D                  "verbose" = TRUE,
##D                  "outfile" = "")
##D     #===================================================
##D     # Example #3 - Multinode of multicore per node cluster
##D     # Running LINUX with SLURM scheduler and MPI communication
##D     # Below, variable 'cpus' is the total number 
##D     # of requested core CPUs, which is specified from  
##D     # within a SLURM script.
##D     #===================================================
##D     if (require("Rmpi")) {
##D         print("'Rmpi' is attached correctly \n")
##D     } else {
##D         stop("'Rmpi' must be attached first \n")
##D     }
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
##D     #===================================================
##D     # Regularized t-test statistics (Real dataset) 
##D     # Multi-Group Assumption
##D     # Assuming unequal variance between groups
##D     # With option to use prior MVR clustering results
##D     # With computation of p-values
##D     #===================================================
##D     mvrt.obj <- mvrt.test(data = NULL,
##D                           obj = mvr.obj,
##D                           block = NULL,
##D                           pval = TRUE,
##D                           replace = FALSE,
##D                           n.resamp = 100,
##D                           parallel = TRUE,
##D                           conf = conf,
##D                           verbose = TRUE,
##D                           seed = 1234)
##D     
## End(Not run)



