library(bcROCsurface)


### Name: ROCsurface
### Title: Receiver operating characteristics surface for a continuous
###   diagnostic test
### Aliases: ROCsurface ROCs.tcf ROCs

### ** Examples

data(EOC)
head(EOC)

## Not run: 
##D # FULL data estimator
##D Dfull <- preDATA(EOC$D.full, EOC$CA125)
##D Dvec.full <- Dfull$Dvec
##D ROCs("full", T = EOC$CA125, Dvec = Dvec.full, , ncp = 30, ellipsoid = TRUE,
##D      cpst = c(-0.56, 2.31))
## End(Not run)

# Preparing the missing disease status
Dna <- preDATA(EOC$D, EOC$CA125)
Dvec.na <- Dna$Dvec
Dfact.na <- Dna$D

# FI estimator
rho.out <- rhoMLogit(Dfact.na ~ CA125 + CA153 + Age, data = EOC, test = TRUE)
ROCs("fi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out, ncp = 30)

## Not run: 
##D # Plot ROC surface and add ellipsoid confidence region
##D ROCs("fi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out, ncp = 30,
##D      ellipsoid = TRUE, cpst = c(-0.56, 2.31))
##D 
##D # MSI estimator
##D ROCs("msi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out, ncp = 30,
##D      ellipsoid = TRUE, cpst = c(-0.56, 2.31))
##D 
##D # IPW estimator
##D pi.out <- psglm(V ~ CA125 + CA153 + Age, data = EOC, test = TRUE)
##D ROCs("ipw", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, piEst = pi.out, ncp = 30,
##D      ellipsoid = TRUE, cpst = c(-0.56, 2.31))
##D 
##D # SPE estimator
##D ROCs("spe", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out, ncp = 30,
##D      piEst = pi.out, ellipsoid = TRUE, cpst = c(-0.56, 2.31))
##D 
##D # 1NN estimator
##D XX <- cbind(EOC$CA125, EOC$CA153, EOC$Age)
##D K.opt <- CVknn(X = XX, Dvec = Dvec.na, V = EOC$V, type = "mahala", plot = TRUE)
##D rho.1nn <- rhoKNN(X = XX, Dvec = Dvec.na, V = EOC$V, K = K.opt, type = "mahala")
##D ROCs("knn", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.1nn, ncp = 30,
##D      ellipsoid = TRUE, cpst = c(-0.56, 2.31))
##D 
##D ## Compute TCFs at three cut points
##D cutps <- rbind(c(0,0.5), c(0,1), c(0.5,1))
##D ROCs.tcf("spe", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out, ncp = 30,
##D          piEst = pi.out, cps = cutps)
## End(Not run)




