library(gap)


### Name: mvmeta
### Title: Multivariate meta-analysis based on generalized least squares
### Aliases: mvmeta
### Keywords: datagen

### ** Examples

## Not run: 
##D # example 11.3 from Hartung et al.
##D #
##D b <- matrix(c(
##D 0.808, 1.308, 1.379, NA, NA,
##D NA, 1.266, 1.828, 1.962, NA,
##D NA, 1.835, NA, 2.568, NA,
##D NA, 1.272, NA, NA, 2.038,
##D 1.171, 2.024, 2.423, 3.159, NA,
##D 0.681, NA, NA, NA, NA),ncol=5, byrow=TRUE)
##D 
##D psi1 <- psi2 <- psi3 <- psi4 <- psi5 <- psi6 <- matrix(0,5,5)
##D 
##D psi1[1,1] <- 0.0985
##D psi1[1,2] <- 0.0611
##D psi1[1,3] <- 0.0623
##D psi1[2,2] <- 0.1142
##D psi1[2,3] <- 0.0761
##D psi1[3,3] <- 0.1215
##D 
##D psi2[2,2] <- 0.0713
##D psi2[2,3] <- 0.0539
##D psi2[2,4] <- 0.0561
##D psi2[3,3] <- 0.0938
##D psi2[3,4] <- 0.0698
##D psi2[4,4] <- 0.0981
##D 
##D psi3[2,2] <- 0.1228
##D psi3[2,4] <- 0.1119
##D psi3[4,4] <- 0.1790
##D 
##D psi4[2,2] <- 0.0562
##D psi4[2,5] <- 0.0459
##D psi4[5,5] <- 0.0815
##D 
##D psi5[1,1] <- 0.0895
##D psi5[1,2] <- 0.0729
##D psi5[1,3] <- 0.0806
##D psi5[1,4] <- 0.0950
##D psi5[2,2] <- 0.1350
##D psi5[2,3] <- 0.1151
##D psi5[2,4] <- 0.1394
##D psi5[3,3] <- 0.1669
##D psi5[3,4] <- 0.1609
##D psi5[4,4] <- 0.2381
##D 
##D psi6[1,1] <- 0.0223
##D 
##D V <- rbind(psi1[upper.tri(psi1,diag=TRUE)],psi2[upper.tri(psi2,diag=TRUE)],
##D psi3[upper.tri(psi3,diag=TRUE)],psi4[upper.tri(psi4,diag=TRUE)],
##D psi5[upper.tri(psi5,diag=TRUE)],psi6[upper.tri(psi6,diag=TRUE)])
##D 
##D mvmeta(b,V)
## End(Not run)



