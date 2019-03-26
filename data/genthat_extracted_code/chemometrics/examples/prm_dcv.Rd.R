library(chemometrics)


### Name: prm_dcv
### Title: Repeated double-cross-validation for robust PLS
### Aliases: prm_dcv
### Keywords: multivariate

### ** Examples

data(NIR)
X <- NIR$xNIR[1:30,]      # first 30 observations - for illustration
y <- NIR$yGlcEtOH[1:30,1] # only variable Glucose
NIR.Glc <- data.frame(X=X, y=y)
res <- prm_dcv(X,y,a=3,repl=2)



