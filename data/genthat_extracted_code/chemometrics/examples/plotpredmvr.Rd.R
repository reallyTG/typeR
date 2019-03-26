library(chemometrics)


### Name: plotpredmvr
### Title: Plot predictions from repeated DCV
### Aliases: plotpredmvr
### Keywords: multivariate

### ** Examples

data(NIR)
X <- NIR$xNIR[1:30,]      # first 30 observations - for illustration
y <- NIR$yGlcEtOH[1:30,1] # only variable Glucose
NIR.Glc <- data.frame(X=X, y=y)
res <- mvr_dcv(y~.,data=NIR.Glc,ncomp=10,method="simpls",repl=10)
plot3 <- plotpredmvr(res,opt=7,y,X,method="simpls")



