library(chemometrics)


### Name: plotSEPprm
### Title: Plot trimmed SEP from repeated DCV of PRM
### Aliases: plotSEPprm
### Keywords: multivariate

### ** Examples

data(NIR)
X <- NIR$xNIR[1:30,]      # first 30 observations - for illustration
y <- NIR$yGlcEtOH[1:30,1] # only variable Glucose
NIR.Glc <- data.frame(X=X, y=y)
res <- prm_dcv(X,y,a=4,repl=2)
plot1 <- plotSEPprm(res,opt=res$afinal,y,X)



