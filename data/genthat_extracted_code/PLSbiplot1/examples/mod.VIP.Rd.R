library(PLSbiplot1)


### Name: mod.VIP
### Title: The Variable Importance in the Projection (VIP) values
### Aliases: mod.VIP

### ** Examples

if(require(chemometrics))
data(cereal, package="chemometrics")
X = as.matrix(cbind(cereal$X))
Y = as.matrix(cbind(cereal$Y))
main2 = mod.VIP(X=X, Y=Y, algorithm=mod.SIMPLS, A=2, cutoff=0.8)
main2
X.new = X[,c(main2$X.impor)]  #important X-variables
X.new

#nutrimouse data
if(require(mixOmics))
data(nutrimouse, package="mixOmics")
X1 = as.matrix(nutrimouse$lipid, ncol=21)
Y1 = as.matrix(nutrimouse$gene, ncol=120)
main = mod.SIMPLS(X=X1, Y=Y1, A=17) #using the SIMPLS algorithm
#RMSEP
RMSEP = main$RMSEP
plot(t(RMSEP), type = "b", xlab="Number of components", ylab="RMSEP  values")
A.final = 9 #from the RMSEP plot
#Final PLSR
mod.SIMPLS(X=X1, Y=Y1, A=A.final)
#VIP
main2 = mod.VIP(X=X1, Y=Y1, algorithm=mod.SIMPLS, A=A.final, cutoff=0.8)
main2
X.new = X1[,c(main2$X.impor)]  #important X-variables
X.new



