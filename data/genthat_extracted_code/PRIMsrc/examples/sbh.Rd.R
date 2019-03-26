library(PRIMsrc)


### Name: sbh
### Title: Cross-Validated Survival Bump Hunting
### Aliases: sbh
### Keywords: Exploratory Survival/Risk Analysis Survival/Risk Estimation &
###   Prediction Non-Parametric Method Cross-Validation Bump Hunting
###   Rule-Induction Method

### ** Examples

#===================================================
# Loading the library and its dependencies
#===================================================
library("PRIMsrc")

## Not run: 
##D     #===================================================
##D     # PRIMsrc Package news
##D     #===================================================
##D     PRIMsrc.news()
##D     
##D     #===================================================
##D     # PRIMsrc Package citation
##D     #===================================================
##D     citation("PRIMsrc")
##D     
##D     #===================================================
##D     # Demo with a synthetic dataset
##D     # Use help for descriptions
##D     #===================================================
##D     data("Synthetic.1", package="PRIMsrc")
##D     ?Synthetic.1
## End(Not run)

#===================================================
# Simulated dataset #1 (n=250, p=3)
# Peeling criterion = LRT
# Cross-Validation criterion = LRT
# With Combined Cross-Validation (RCCV)
# Without Replications (B = 1)
# Without variable screening (pre-selection)
# Without computation of log-rank \eqn{p}-values
# Without parallelization
#===================================================
synt1 <- sbh(X = Synthetic.1[ , -c(1,2), drop=FALSE],
             y = Synthetic.1[ ,1, drop=TRUE],
             delta = Synthetic.1[ ,2, drop=TRUE],
             B = 1,
             K = 3,
             vs = FALSE,
             cv = TRUE,
             cvtype = "combined",
             cvarg = "alpha=0.10,
                      beta=0.10,
                      peelcriterion=\"lrt\",
                      cvcriterion=\"lrt\"",
             groups = NULL,
             pv = FALSE,
             decimals = 2,
             onese = FALSE,
             probval = 0.5,
             timeval = NULL,
             parallel.vs = FALSE,
             parallel.rep = FALSE,
             parallel.pv = FALSE,
             conf = NULL,
             verbose = FALSE,
             seed = 123)

summary(object = synt1)
print(x = synt1)

n <- 100
p <- length(synt1$cvfit$cv.used)
x <- matrix(data = runif(n = n*p, min = 0, max = 1),
            nrow = n, ncol = p, byrow = FALSE,
            dimnames = list(1:n, paste("X", 1:p, sep="")))
synt1.pred <- predict(object = synt1,
                      newdata = x,
                      steps = synt1$cvfit$cv.nsteps)

plot(x = synt1,
     main = paste("Scatter plot for model #1", sep=""),
     proj = c(1,2),
     steps = synt1$cvfit$cv.nsteps,
     pch = 16, cex = 0.5, col = c(1,2),
     boxes = TRUE,
     col.box = 2, lty.box = 2, lwd.box = 1,
     add.caption.box = TRUE, 
     text.caption.box = paste("Step: ", synt1$cvfit$cv.nsteps, sep=""),
     device = NULL)

plot_profile(object = synt1,
             main = "Cross-validated tuning profiles for model #1",
             pch = 20, col = 1, lty = 1, lwd = 0.5, cex = 0.5,
             add.sd = TRUE, 
             add.profiles = TRUE,
             add.caption = TRUE, 
             text.caption = c("Mean","Std. Error"),
             device = NULL)

plot_traj(object = synt1,
          main = paste("Cross-validated peeling trajectories for model #1", sep=""),
          col = 1, lty = 1, lwd = 0.5, cex = 0.5,
          toplot = synt1$cvfit$cv.used,
          device = NULL)

plot_trace(object = synt1,
           main = paste("Cross-validated trace plots for model #1", sep=""),
           xlab = "Box Mass", ylab = "Covariate Range (centered)",
           col = 1, lty = 1, lwd = 0.5, cex = 0.5,
           toplot = synt1$cvfit$cv.used,
           center = TRUE, scale = FALSE,
           device = NULL)

plot_km(object = synt1,
        main = paste("Cross-validated probability curves for model #1", sep=""),
        xlab = "Time", ylab = "Probability",
        ci = TRUE,
        steps = 1:synt1$cvfit$cv.nsteps,
        col = c(1,2), lty = 1, lwd = 0.5, cex = 0.5,
        add.caption = TRUE,
        text.caption = c("outbox","inbox"), 
        device = NULL)
                                
## Not run: 
##D     #===================================================
##D     # Examples of parallel backend parametrization 
##D     #===================================================
##D     if (require("parallel")) {
##D        cat("'parallel' is attached correctly \n")
##D     } else {
##D        stop("'parallel' must be attached first \n")
##D     }
##D     #===================================================
##D     # Ex. #1 - Multicore PC
##D     # Running WINDOWS
##D     # SOCKET communication cluster
##D     # Shared memory parallelization
##D     #===================================================
##D     cpus <- parallel::detectCores(logical = TRUE)
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
##D                  "type" = "SOCKET",
##D                  "homo" = TRUE,
##D                  "verbose" = TRUE,
##D                  "outfile" = "")
##D     #===================================================
##D     # Ex. #3 - Enterprise Multinode Cluster w/ multicore/node  
##D     # Running LINUX with SLURM scheduler
##D     # MPI communication cluster
##D     # Distributed memory parallelization
##D     #==================================================
##D     if (require("Rmpi")) {
##D         cat("'Rmpi' is attached correctly \n")
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
##D     # Simulated dataset #1 (n=250, p=3)
##D     # Peeling criterion = LRT
##D     # Cross-Validation criterion = LRT
##D     # With Combined Cross-Validation (RCCV)
##D     # With Replications (B = 30)
##D     # With PPL variable screening (pre-selection)
##D     # With computation of log-rank \eqn{p}-values
##D     # With parallelization
##D     #===================================================                         
##D     synt1 <- sbh(X = Synthetic.1[ , -c(1,2), drop=FALSE],
##D                  y = Synthetic.1[ ,1, drop=TRUE],
##D                  delta = Synthetic.1[ ,2, drop=TRUE],
##D                  B = 30,
##D                  K = 5,
##D                  A = 1000,
##D                  vs = TRUE,
##D                  vstype = "ppl",
##D                  vsarg = "alpha=1,
##D                           nalpha=1,
##D                           nlambda=100",
##D                  vscons = 0.5,
##D                  cv = TRUE,
##D                  cvtype = "combined",
##D                  cvarg = "alpha=0.01,
##D                           beta=0.10,
##D                           peelcriterion=\"lrt\",
##D                           cvcriterion=\"lrt\"",
##D                  groups = NULL,
##D                  pv = TRUE,
##D                  decimals = 2,
##D                  onese = FALSE,
##D                  probval = 0.5,
##D                  timeval = NULL,
##D                  parallel.vs = FALSE,
##D                  parallel.rep = TRUE,
##D                  parallel.pv = TRUE,
##D                  conf = conf,
##D                  verbose = TRUE,
##D                  seed = 123)      
##D     #===================================================
##D     # Simulated dataset #4 (n=100, p=1000)
##D     # Peeling criterion = LRT
##D     # Cross-Validation criterion = CER
##D     # With Combined Cross-Validation (RCCV)
##D     # With Replications (B = 30)
##D     # With PRSP variable screening (pre-selection)
##D     # With computation of log-rank \eqn{p}-values
##D     # With parallelization
##D     #===================================================                         
##D     synt4 <- sbh(X = Synthetic.4[ , -c(1,2), drop=FALSE],
##D                  y = Synthetic.4[ ,1, drop=TRUE],
##D                  delta = Synthetic.4[ ,2, drop=TRUE],
##D                  B = 30,
##D                  K = 5,
##D                  A = 1000,
##D                  vs = TRUE,
##D                  vstype = "prsp",
##D                  vsarg = "alpha=0.01,
##D                           beta=0.10,
##D                           msize=NULL,
##D                           peelcriterion=\"lrt\",
##D                           cvcriterion=\"cer\"",
##D                  vscons = 0.5,
##D                  cv = TRUE,
##D                  cvtype = "combined",
##D                  cvarg = "alpha=0.01,
##D                           beta=0.10,
##D                           peelcriterion=\"lrt\",
##D                           cvcriterion=\"cer\"",
##D                  groups = NULL,
##D                  pv = TRUE,
##D                  decimals = 2,
##D                  onese = FALSE,
##D                  probval = 0.5,
##D                  timeval = NULL,
##D                  parallel.vs = FALSE,
##D                  parallel.rep = TRUE,
##D                  parallel.pv = TRUE,
##D                  conf = conf,
##D                  verbose = TRUE,
##D                  seed = 123)
## End(Not run)



