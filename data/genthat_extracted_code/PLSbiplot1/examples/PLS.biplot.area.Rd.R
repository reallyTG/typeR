library(PLSbiplot1)


### Name: PLS.biplot.area
### Title: The Partial Least Squares (PLS) biplot with triangles for
###   estimating the Partial Least Squares Regression (PLSR) coefficients
### Aliases: PLS.biplot.area

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
#with 1 triangle
PLS.biplot.area(X, Y, algorithm=mod.SIMPLS, ax.tickvec.X=c(8,5,5,5,5),
ax.tickvec.Y=c(5,10,5,6,7,10), base.tri=3, bi.value=4)
#with 4 triangles
PLS.biplot.area(X, Y, algorithm=mod.SIMPLS, ax.tickvec.X=c(8,5,5,5,5),
ax.tickvec.Y=c(5,10,5,6,7,10), base.tri=2, bi.value=c(1,2,3,4,5))



