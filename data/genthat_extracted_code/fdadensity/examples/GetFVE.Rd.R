library(fdadensity)


### Name: GetFVE
### Title: Compute Metric-based Fraction of Variance Explained
### Aliases: GetFVE

### ** Examples


data(Top50BabyNames)

# Perform Transformation FPCA for male baby name densities
dSup = Top50BabyNames$x
X = FPCAdens(dmatrix = t(Top50BabyNames$dens$male), dSup = dSup, useAlpha = TRUE, 
                   optns = list(dataType = 'Dense', error = FALSE, methodSelectK = 8))

# Compute FVE - must compare to regularized densities 

fveL2 = GetFVE(fpcaObj = X, dmatrix = t(Top50BabyNames$dens$male), dSup = dSup, useAlpha = TRUE)
fveW = GetFVE(fpcaObj = X, dmatrix = t(Top50BabyNames$dens$male), dSup = dSup, 
                   metric = 'W', useAlpha = TRUE)




