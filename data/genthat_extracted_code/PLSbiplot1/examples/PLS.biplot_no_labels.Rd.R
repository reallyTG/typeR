library(PLSbiplot1)


### Name: PLS.biplot_no_labels
### Title: The Partial Least Squares (PLS) biplot with the labels of the
###   samples, coefficient points and tick markers excluded
### Aliases: PLS.biplot_no_labels

### ** Examples

if(require(pls))
data(oliveoil, package="pls")
X = as.matrix(oliveoil$chemical, ncol=5)
dimnames(X) = list(paste(c("G1","G2","G3","G4","G5","I1","I2","I3","I4","I5",
"S1","S2","S3","S4","S5","S6")),
paste(c("Acidity","Peroxide","K232","K270","DK")))
Y = as.matrix(oliveoil$sensory, ncol=6)
dimnames(Y) = list(paste(c("G1","G2","G3","G4","G5","I1","I2","I3","I4","I5",
"S1","S2","S3","S4","S5","S6")),
paste(c("Yellow","Green","Brown","Glossy","Transp","Syrup")))
PLS.biplot_no_labels(X, Y, algorithm=mod.SIMPLS, ax.tickvec.X=c(8,5,5,5,5),
ax.tickvec.Y=c(5,8,5,6,9,8))

#cocktail data
if(require(SensoMineR))
data(cocktail, package="SensoMineR")
X3 = as.matrix(compo.cocktail, ncol=4)
Y3 = as.matrix(senso.cocktail, ncol=13)
PLS.biplot_no_labels(X=X3, Y3, algorithm=mod.SIMPLS, ax.tickvec.X=rep(2,ncol(X3)),
ax.tickvec.Y=rep(3,ncol(Y3)))



