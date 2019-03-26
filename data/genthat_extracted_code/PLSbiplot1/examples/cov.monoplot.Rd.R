library(PLSbiplot1)


### Name: cov.monoplot
### Title: The covariance monoplot
### Aliases: cov.monoplot

### ** Examples

if(require(pls))
data(oliveoil, package="pls")
Y = as.matrix(oliveoil$sensory, ncol=6)
dimnames(Y) = list(paste(c("G1","G2","G3","G4","G5","I1","I2","I3","I4",
"I5","S1","S2","S3","S4","S5","S6")),
paste(c("Yellow","Green","Brown","Glossy","Transp","Syrup")))
cov.monoplot(Y)

#cocktail data
if(require(SensoMineR))
data(cocktail, package="SensoMineR")
Y3 = as.matrix(senso.cocktail, ncol=13)
cov.monoplot(Y3)



