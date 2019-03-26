library(resemble)


### Name: mbl
### Title: A function for memory-based learning (mbl)
### Aliases: mbl

### ** Examples

## Not run: 
##D require(prospectr)
##D 
##D data(NIRsoil)
##D 
##D # Filter the data using the Savitzky and Golay smoothing filter with 
##D # a window size of 11 spectral variables and a polynomial order of 3 
##D # (no differentiation).
##D sg <- savitzkyGolay(NIRsoil$spc, p = 3, w = 11, m = 0) 
##D 
##D # Replace the original spectra with the filtered ones
##D NIRsoil$spc <- sg
##D 
##D Xu <- NIRsoil$spc[!as.logical(NIRsoil$train),]
##D Yu <- NIRsoil$CEC[!as.logical(NIRsoil$train)]
##D 
##D Yr <- NIRsoil$CEC[as.logical(NIRsoil$train)]
##D Xr <- NIRsoil$spc[as.logical(NIRsoil$train),]
##D 
##D Xu <- Xu[!is.na(Yu),]
##D Xr <- Xr[!is.na(Yr),]
##D 
##D Yu <- Yu[!is.na(Yu)]
##D Yr <- Yr[!is.na(Yr)]
##D 
##D # Example 1
##D # A mbl implemented in Ramirez-Lopez et al. (2013, 
##D # the spectrum-based learner)
##D # Example 1.1
##D # An exmaple where Yu is supposed to be unknown, but the Xu 
##D # (spectral variables) are known 
##D ctrl1 <- mblControl(sm = "pc", pcSelection = list("opc", 40), 
##D                     valMethod = "NNv", 
##D                     scaled = FALSE, center = TRUE)
##D 
##D sbl.u <- mbl(Yr = Yr, Xr = Xr, Yu = NULL, Xu = Xu,
##D              mblCtrl = ctrl1, 
##D              dissUsage = "predictors", 
##D              k = seq(40, 150, by = 10), 
##D              method = "gpr")
##D sbl.u
##D plot(sbl.u)
##D 
##D 
##D  
##D # Example 1.2
##D # If Yu is actually known... 
##D sbl.u2 <- mbl(Yr = Yr, Xr = Xr, Yu = Yu, Xu = Xu,
##D               mblCtrl = ctrl1, 
##D               dissUsage = "predictors", 
##D               k = seq(40, 150, by = 10), 
##D               method = "gpr")
##D sbl.u2
##D 
##D # Example 1.3
##D # A variation of the spectrum-based learner implemented in 
##D # Ramirez-Lopez et al. (2013) where the dissimilarity matrices are 
##D # recomputed based on partial least squares scores
##D ctrl_1.3 <- mblControl(sm = "pls", pcSelection = list("opc", 40), 
##D                        valMethod = "NNv", 
##D                        scaled = FALSE, center = TRUE)
##D                           
##D sbl_1.3 <- mbl(Yr = Yr, Xr = Xr, Yu = Yu, Xu = Xu,
##D                mblCtrl = ctrl_1.3,
##D                dissUsage = "predictors",
##D                k = seq(40, 150, by = 10), 
##D                method = "gpr")
##D sbl_1.3
##D 
##D # Example 2
##D # A mbl similar to the ones implemented in 
##D # Ramirez-Lopez et al. (2013) 
##D # and Fernandez Pierna and Dardenne (2008)
##D ctrl.mbl <- mblControl(sm = "cor", 
##D                        pcSelection = list("cumvar", 0.999), 
##D                        valMethod = "NNv", 
##D                        scaled = FALSE, center = TRUE)
##D                           
##D local.mbl <- mbl(Yr = Yr, Xr = Xr, Yu = Yu, Xu = Xu,
##D                  mblCtrl = ctrl.mbl,
##D                  dissUsage = "none",
##D                  k = seq(40, 150, by = 10), 
##D                  pls.c = c(5, 15),
##D                  method = "wapls1")
##D local.mbl
##D 
##D # Example 3
##D # A variation of the previous example (using the optimized pc 
##D # dissmilarity matrix) using the control list of the example 1
##D                          
##D local.mbl2 <- mbl(Yr = Yr, Xr = Xr, Yu = Yu, Xu = Xu,
##D                   mblCtrl = ctrl1,
##D                   dissUsage = "none",
##D                   k = seq(40, 150, by = 10), 
##D                   pls.c = c(5, 15),
##D                   method = "wapls1")
##D local.mbl2
##D 
##D # Example 4
##D # Using the function with user-defined dissimilarities:
##D # Examples 4.1 - 4.2: Compute a square symetric matrix of 
##D # dissimilarities between 
##D # all the elements in Xr and Xu (dissimilarities will be used as 
##D # additional predictor variables later in the mbl function)
##D 
##D # Examples 4.3 - 4.4: Derive a dissimilarity value of each element 
##D # in Xu to each element in Xr (in this case dissimilarities will 
##D # not be used as additional predictor variables later in the 
##D # mbl function)
##D 
##D # Example 4.1
##D # the manhattan distance 
##D manhattanD <- dist(rbind(Xr, Xu), method = "manhattan") 
##D manhattanD <- as.matrix(manhattanD)
##D 
##D ctrl.udd <- mblControl(sm = "none", 
##D                        pcSelection = list("cumvar", 0.999), 
##D                        valMethod = c("NNv", "loc_crossval"), 
##D                        resampling = 10, p = 0.75,
##D                        scaled = FALSE, center = TRUE)
##D 
##D mbl.udd1 <- mbl(Yr = Yr, Xr = Xr, Yu = Yu, Xu = Xu,
##D                 mblCtrl = ctrl.udd, 
##D                 dissimilarityM = manhattanD,
##D                 dissUsage = "predictors",
##D                 k = seq(40, 150, by = 10), 
##D                 method = "gpr")
##D mbl.udd1
##D 
##D #Example 4.2
##D # first derivative spectra
##D Xr.der.sp <- t(diff(t(rbind(Xr, Xu)), lag = 7, differences = 1)) 
##D Xu.der.sp <- t(diff(t(Xu), lag = 7, differences = 1)) 
##D 
##D # The principal components dissimilarity on the derivative spectra 
##D der.ortho <- orthoDiss(Xr = Xr.der.sp, X2 = Xu.der.sp,
##D                        Yr = Yr,
##D                        pcSelection = list("opc", 40),
##D                        method = "pls",
##D                        center = FALSE, scale = FALSE) 
##D 
##D der.ortho.diss <- der.ortho$dissimilarity
##D 
##D # mbl applied to the absorbance spectra
##D mbl.udd2 <- mbl(Yr = Yr, Xr = Xr, Yu = Yu, Xu = Xu,
##D                 mblCtrl = ctrl.udd, 
##D                 dissimilarityM = der.ortho.diss,
##D                 dissUsage = "none",
##D                 k = seq(40, 150, by = 10), 
##D                 method = "gpr")
##D                                 
##D #Example 4.3
##D # first derivative spectra
##D der.Xr <- t(diff(t(Xr), lag = 1, differences = 1)) 
##D der.Xu <- t(diff(t(Xu), lag = 1, differences = 1))
##D # the sid on the derivative spectra
##D der.sid <- sid(Xr = der.Xr, X2 = der.Xu, mode = "density", 
##D                center = TRUE, scaled = FALSE) 
##D der.sid <- der.sid$sid
##D 
##D mbl.udd3 <- mbl(Yr = Yr, Xr = Xr, Yu = Yu, Xu = Xu,
##D                 mblCtrl = ctrl.udd, 
##D                 dissimilarityM = der.sid,
##D                 dissUsage = "none",
##D                 k = seq(40, 150, by = 10), 
##D                 method = "gpr")
##D mbl.udd3
##D 
##D # Example 5
##D # For running the mbl function in parallel
##D n.cores <- detectCores() - 1
##D if(n.cores == 0) n.cores <- 1
##D 
##D # Set the number of cores according to the OS
##D if (.Platform$OS.type == "windows") {
##D   require(doParallel)
##D   clust <- makeCluster(n.cores)   
##D   registerDoParallel(clust)
##D }else{
##D   require(doSNOW)
##D   clust <- makeCluster(n.cores, type = "SOCK")
##D   registerDoSNOW(clust)
##D   ncores <- getDoParWorkers()
##D }
##D 
##D ctrl <- mblControl(sm = "pc", pcSelection = list("opc", 40), 
##D                    valMethod = "NNv",
##D                    scaled = FALSE, center = TRUE)
##D 
##D mbl.p <- mbl(Yr = Yr, Xr = Xr, Yu = Yu, Xu = Xu,
##D              mblCtrl = ctrl, 
##D              dissUsage = "none",
##D              k = seq(40, 150, by = 10), 
##D              method = "gpr")
##D registerDoSEQ()
##D try(stopCluster(clust))
##D mbl.p
## End(Not run)



