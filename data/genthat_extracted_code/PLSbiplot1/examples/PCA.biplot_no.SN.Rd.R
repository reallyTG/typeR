library(PLSbiplot1)


### Name: PCA.biplot_no.SN
### Title: The Principal Component Analysis (PCA) biplot with the labels of
###   the samples points excluded
### Aliases: PCA.biplot_no.SN

### ** Examples

if(require(pls))
data(oliveoil, package="pls")
Dmat = as.matrix(oliveoil)  #(16x11) overall original data matrix
dimnames(Dmat) = list(paste(c("G1","G2","G3","G4","G5","I1","I2","I3","I4","I5",
"S1","S2","S3","S4","S5","S6")),
paste(c("Acidity","Peroxide","K232","K270","DK","Yellow","Green","Brown",
"Glossy","Transp","Syrup")))
PCA.biplot_no.SN(D=Dmat, method=mod.PCA, ax.tickvec.D=c(8,5,5,7,6,4,5,5,8,7,7))

#glass data
if(require(chemometrics))
data(glass, package="chemometrics")
Dmat = matrix(glass,ncol=13)
dimnames(Dmat) = list(1:180, paste(c("Na2O", "MgO", "Al2O3", "SiO2",
"P2O5", "SO3", "Cl", "K2O", "CaO", "MnO", "Fe2O3", "BaO", "PbO")))
PCA.biplot_no.SN(D=Dmat, method=mod.PCA, ax.tickvec.D=rep(5,ncol(Dmat)))



