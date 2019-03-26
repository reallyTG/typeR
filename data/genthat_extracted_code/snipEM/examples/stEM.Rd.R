library(snipEM)


### Name: stEM
### Title: Snipping and trimming for location and scatter estimation with
###   casewise and cellwise outliers
### Aliases: stEM

### ** Examples

## Not run: 
##D # 10% cellwise outliers
##D Xc <- generate.cellcontam(100, 10, 100, 5, 0.10)
##D A <- Xc$A   # true correlation matrix
##D Uc <- Xc$u  # (true outlier) binary matrix 
##D Xc <- Xc$x
##D 
##D # 5% case-wise outliers
##D Xct <- generate.casecontam(100, 10, 100, 10, 0.05)
##D Xc <- rbind(Xc, Xct$x[ rowSums(Xct$u == 1) == 10,])
##D trim <- rep(1,105)
##D trim[101:105] <- 0  # (true casewise outlier) binary vector
##D Uc <- rbind(Uc, matrix(1,5,10))
##D 
##D # initial V
##D V <- matrix(1, 105, 10)
##D # identify rows to be trimmed
##D km <- kmeans(Xc,2)$clust
##D wtrim <- which(km==which.min(table(km)))
##D V[wtrim,] <- 0
##D Vtmp <- V[-wtrim,]
##D 
##D # identify cells to be snipped
##D Vtmp[!is.na(match(as.vector(Xc[-wtrim,]),boxplot(as.vector(Xc[-wtrim,]),plot=FALSE)$out))] <- 0
##D Xna <- Xc[-wtrim,]
##D Xna[ which( Vtmp == 0) ] <- NA
##D resEMVE <- emve(Xna)
##D Vtmp <- snipEM.initialV(Xc[-wtrim,], Vtmp, resEMVE@mu, resEMVE@S)
##D V[-wtrim,] <- Vtmp$V
##D 
##D # Performance in LRT distance
##D resSTEM <- stEM(Xc, V)
##D slrt(resSTEM$S, A)
##D slrt(cov(Xc), A)
## End(Not run)


