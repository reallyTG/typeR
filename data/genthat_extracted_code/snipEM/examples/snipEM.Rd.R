library(snipEM)


### Name: snipEM
### Title: Snipping for location and scatter estimation with cellwise
###   outliers
### Aliases: snipEM snipEM.initialV

### ** Examples

## Not run: 
##D # 10% cellwise outliers
##D n=100
##D p=10
##D Xc <- generate.cellcontam(100, 10, 100, 5, 0.10)
##D A <- Xc$A   # true correlation matrix
##D Uc <- Xc$u  # (true outlier) binary matrix 
##D Xc <- Xc$x
##D 
##D # initial V 
##D V <- matrix(1,n,p)
##D V[!is.na(match(as.vector(Xc),boxplot(as.vector(Xc),plot=FALSE)$out))] <- 0
##D Xna <- Xc 
##D Xna[ which( V == 0) ] <- NA
##D resEMVE <- emve(Xna)
##D V <- snipEM.initialV(Xc, V, resEMVE@mu, resEMVE@S)$V
##D 
##D # Performance in LRT distance
##D resSEM <- snipEM(Xc, V)
##D slrt(resSEM$S, A)
##D slrt(cov(Xc), A)
## End(Not run)



