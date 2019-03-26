library(chemometrics)


### Name: stepwise
### Title: Stepwise regression
### Aliases: stepwise
### Keywords: multivariate

### ** Examples

data(NIR)
X <- NIR$xNIR[1:30,]      # first 30 observations - for illustration
y <- NIR$yGlcEtOH[1:30,1] # only variable Glucose
NIR.Glc <- data.frame(X=X, y=y)
res=stepwise(y~.,data=NIR.Glc,maxsteps=2)   



