library(PLSbiplot1)


### Name: mod.PCR
### Title: Principal Component Regression (PCR)
### Aliases: mod.PCR

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
mod.PCR(X, Y, r=2)



