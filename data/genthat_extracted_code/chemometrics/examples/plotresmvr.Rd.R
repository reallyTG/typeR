library(chemometrics)


### Name: plotresmvr
### Title: Plot residuals from repeated DCV
### Aliases: plotresmvr
### Keywords: multivariate

### ** Examples

data(NIR)
X <- NIR$xNIR[1:30,]      # first 30 observations - for illustration
y <- NIR$yGlcEtOH[1:30,1] # only variable Glucose
NIR.Glc <- data.frame(X=X, y=y)
res <- mvr_dcv(y~.,data=NIR.Glc,ncomp=10,method="simpls",repl=10)
plot4 <- plotresmvr(res,opt=7,y,X,method="simpls")



