library(resemble)


### Name: simEval
### Title: A function for evaluating similarity/dissimilarity matrices
###   (simEval)
### Aliases: simEval

### ** Examples

## Not run: 
##D require(prospectr)
##D 
##D data(NIRsoil)
##D 
##D Yr <- NIRsoil$Nt[as.logical(NIRsoil$train)]
##D Xr <- NIRsoil$spc[as.logical(NIRsoil$train),]
##D 
##D # Example 1
##D # Compute a principal components distance
##D pca.d <- orthoDiss(Xr = Xr, pcSelection = list("cumvar", 0.999), 
##D                    method = "pca", 
##D                    local = FALSE, 
##D                    center = TRUE, scaled = TRUE)
##D 
##D # The final number of pcs used for computing the distance 
##D # matrix of objects in Xr
##D pca.d$n.components
##D 
##D # The final distance matrix 
##D ds <- pca.d$dissimilarity
##D 
##D # Example 1.1
##D # Evaluate the distance matrix on the baisis of the 
##D # side information (Yr) associated with Xr
##D se <- simEval(d = ds, sideInf = Yr)
##D 
##D # The final evaluation results
##D se$eval
##D 
##D # The final values of the side information (Yr) and the values of 
##D # the side information corresponding to the first nearest neighbours 
##D # found by using the distance matrix
##D se$firstNN
##D 
##D # Example 1.2
##D # Evaluate the distance matrix on the baisis of two side 
##D # information (Yr and Yr2) 
##D # variables associated with Xr
##D Yr2 <- NIRsoil$CEC[as.logical(NIRsoil$train)]
##D se2 <- simEval(d = ds, sideInf = cbind(Yr, Yr2))
##D 
##D # The final evaluation results
##D se2$eval
##D 
##D # The final values of the side information variables and the values 
##D # of the side information variables corresponding to the first 
##D # nearest neighbours found by using the distance matrix
##D se2$firstNN
##D 
##D ###
##D # Example 2
##D # Evaluate the distances produced by retaining different number of 
##D # principal components (this is the same principle used in the 
##D # optimized principal components approach ("opc"))
##D 
##D # first project the data
##D pca <- orthoProjection(Xr = Xr, method = "pca", 
##D                        pcSelection = list("manual", 30), 
##D                        center = TRUE, scaled = TRUE)
##D 
##D # standardize the scores
##D scores.s <- sweep(pca$scores, MARGIN = 2, 
##D                   STATS = pca$sc.sdv, FUN = "/")
##D rslt <-  matrix(NA, ncol(scores.s), 3)
##D colnames(rslt) <- c("pcs", "rmsd", "r")
##D rslt[,1] <- 1:ncol(scores.s)
##D for(i in 1:ncol(scores.s))
##D {
##D   sc.ipcs <- scores.s[ ,1:i, drop = FALSE]
##D   di <- fDiss(Xr = sc.ipcs, method = "euclid", 
##D               center = FALSE, scaled = FALSE)
##D   se <- simEval(d = di, sideInf = Yr)
##D   rslt[i,2:3] <- unlist(se$eval)
##D }
##D plot(rslt) 
##D 
##D ###
##D # Example 3
##D # Example 3.1
##D # Evaluate a dissimilarity matrix computed using a moving window 
##D # correlation method
##D mwcd <- mcorDiss(Xr = Xr, ws = 35, center = FALSE, scaled = FALSE)
##D se.mw <- simEval(d = mwcd, sideInf = Yr)
##D se.mw$eval
##D 
##D # Example 3.2
##D # Evaluate a dissimilarity matrix computed using the correlation 
##D # method
##D cd <- corDiss(Xr = Xr, center = FALSE, scaled = FALSE)
##D se.nc <- simEval(d = cd, sideInf = Yr)
##D se.nc$eval
## End(Not run)



