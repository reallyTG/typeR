library(bcROCsurface)


### Name: asyCovTCF
### Title: Asymptotic variance-covariance estimation for True Class
###   Fractions (TCFs) at the cut point (c_1, c_2)
### Aliases: asyCovTCF

### ** Examples

data(EOC)

# FULL data estimator
Dfull <- preDATA(EOC$D.full, EOC$CA125)
Dvec.full <- Dfull$Dvec

full.tcf <- ROCs.tcf("full", T = EOC$CA125, Dvec = Dvec.full, cps = c(2, 4))
full.var <- asyCovTCF(full.tcf, T = EOC$CA125, Dvec = Dvec.full)

# Preparing the missing disease status
Dna <- preDATA(EOC$D, EOC$CA125)
Dfact.na <- Dna$D
Dvec.na <- Dna$Dvec

rho.out <- rhoMLogit(Dfact.na ~ CA125 + CA153 + Age, data = EOC, test = TRUE)

## FI estimator
fi.tcf <- ROCs.tcf("fi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
                   rhoEst = rho.out, cps = c(2,4))
fi.var <- asyCovTCF(fi.tcf, T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
                    rhoEst = rho.out)

## MSI estimator
msi.tcf <- ROCs.tcf("msi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
                    rhoEst = rho.out, cps = c(2,4))
msi.var <- asyCovTCF(msi.tcf, T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
                     rhoEst = rho.out)

## IPW estimator
pi.out <- psglm(V ~ CA125 + CA153 + Age, data = EOC, test = TRUE)

ipw.tcf <- ROCs.tcf("ipw", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
                    piEst = pi.out, cps = c(2,4))
ipw.var <- asyCovTCF(ipw.tcf, T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
                     piEst = pi.out)

## SPE estimator
spe.tcf <- ROCs.tcf("spe", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
                   rhoEst = rho.out, piEst = pi.out, cps = c(2,4))
spe.var <- asyCovTCF(spe.tcf, T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
                     rhoEst = rho.out, piEst = pi.out)

## KNN estimators
XX <- cbind(EOC$CA125, EOC$CA153, EOC$Age)
rho.1nn <- rhoKNN(X = XX, Dvec = Dvec.na, V = EOC$V, K = 1, type = "mahala")
knn.tcf <- ROCs.tcf("knn", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
                   rhoEst = rho.1nn, cps = c(2,4))
knn.var <- asyCovTCF(knn.tcf, T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
                     rhoEst = rho.1nn)





