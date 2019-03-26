library(PLSbiplot1)


### Name: mod.SIMPLS
### Title: The Statistical Inspired Modification to Partial Least Squares
###   (SIMPLS) algorithm
### Aliases: mod.SIMPLS

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
#final number of PLS components
RMSEP = mod.SIMPLS(X, Y, A=5)$RMSEP #RMSEP values
plot(t(RMSEP), type = "b", xlab="Number of components", ylab="RMSEP  values")
A.final = 2 #from the RMSEP plot
#PLS matrices R, P, T, Q, and Y.hat from SIMPLS algorithm
options(digits=3)
mod.SIMPLS(X, Y, A=A.final)



