library(PLSbiplot1)


### Name: Mag.Bmat.plot
### Title: Magnitude of the Partial Least Squares Regression (PLSR)
###   coefficients matrix
### Aliases: Mag.Bmat.plot

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
Mag.Bmat.plot(X, Y, algorithm=mod.SIMPLS, A=2)

#nutrimouse data
if(require(mixOmics))
data(nutrimouse, package="mixOmics")
X1 = as.matrix(nutrimouse$lipid, ncol=21)
Y1 = as.matrix(nutrimouse$gene, ncol=120)
#VIP
A.final = 9
main2 = mod.VIP(X=X1, Y=Y1, algorithm=mod.SIMPLS, A=A.final, cutoff=0.8)
X.new = X1[,c(main2$X.impor)]  #important X-variables
Mag.Bmat.plot(X=X.new, Y1, algorithm=mod.SIMPLS, A=A.final)
#alternatively
X.scal = scale(X.new, center=TRUE, scale=TRUE)
Y.scal = scale(Y1, center=TRUE, scale=TRUE)
main3 = mod.SIMPLS(X.scal, Y.scal, A.final)
Bmat = main3$X.weights.trans %*% t(main3$Y.loadings)  #PLSR coefficients matrix
dimnames(Bmat) = list(colnames(X.new), colnames(Y1))
Abs.Bmat = abs(Bmat) #absolute values of the coefficients
rowMeans(Abs.Bmat)



