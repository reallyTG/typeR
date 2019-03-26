library(chemometrics)


### Name: plotSEPmvr
### Title: Plot SEP from repeated DCV
### Aliases: plotSEPmvr
### Keywords: multivariate

### ** Examples

data(NIR)
X <- NIR$xNIR[1:30,]      # first 30 observations - for illustration
y <- NIR$yGlcEtOH[1:30,1] # only variable Glucose
NIR.Glc <- data.frame(X=X, y=y)
res <- mvr_dcv(y~.,data=NIR.Glc,ncomp=10,method="simpls",repl=10)
plot1 <- plotSEPmvr(res,opt=7,y,X,method="simpls")



