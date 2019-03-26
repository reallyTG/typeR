library(PLSbiplot1)


### Name: PLS.biplot
### Title: The Partial Least Squares (PLS) biplot
### Aliases: PLS.biplot

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
#SIMPLS biplot
PLS.biplot(X, Y, algorithm=mod.SIMPLS, ax.tickvec.X=c(8,5,5,5,5), ax.tickvec.Y=c(5,8,5,6,9,8))
#Kernel PLS biplot
PLS.biplot(X, Y, algorithm=mod.KernelPLS_R, ax.tickvec.X=c(3,3,4,5,2), ax.tickvec.Y=c(3,3,5,6,7,6))



