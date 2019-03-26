library(bcROCsurface)


### Name: vus
### Title: Estimation methods for volume under ROC surface (VUS)
### Aliases: vus

### ** Examples

data(EOC)
head(EOC)


## Not run: 
##D # FULL data estimator
##D Dfull <- preDATA(EOC$D.full, EOC$CA125)
##D Dvec.full <- Dfull$Dvec
##D vus("full", T = EOC$CA125, Dvec = Dvec.full)
## End(Not run)

# Preparing the missing disease status
Dna <- preDATA(EOC$D, EOC$CA125)
Dfact.na <- Dna$D
Dvec.na <- Dna$Dvec
# FI estimator
rho.out <- rhoMLogit(Dfact.na ~ CA125 + CA153 + Age, data = EOC, test = TRUE)

vus("fi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out)

## Not run: 
##D # MSI estimator
##D vus("msi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out)
##D 
##D # IPW estimator
##D pi.out <- psglm(V ~ CA125 + CA153 + Age, data = EOC, test = TRUE)
##D vus("ipw", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, piEst = pi.out)
##D 
##D # SPE estimator
##D vus("spe", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out, piEst = pi.out)
##D 
##D # KNN estimator, K = 1, Mahalanobis distance
##D XX <- cbind(EOC$CA125, EOC$CA153, EOC$Age)
##D rho.maha.1nn <- rhoKNN(X = XX, Dvec = Dvec.na, V = EOC$V, K = 1, type = "mahala")
##D vus("knn", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.maha.1nn)
## End(Not run)




