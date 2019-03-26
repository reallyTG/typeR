library(gencve)


### Name: rdigitsBFOS
### Title: BFOS Digit Recognition Problem
### Aliases: rdigitsBFOS
### Keywords: models classif datagen

### ** Examples

#debug-rdigitsBFOS.R
#with alpha=0.1, not significantly different from 0.25
require("C50")
n <- 1000
Xy <- rdigitsBFOS(n, alpha=0.1)
attr(Xy, "title")
names(Xy)
ans <- C5.0(digit~., data=Xy)
XyTest <- rdigitsBFOS(n, alpha=0.1)
yHat <- predict(ans, newdata=XyTest[,1:7])
eta <- mean(yHat!=XyTest$digit)
MOE95pc <- 1.96*sqrt(eta*(1-eta)/(10*n))
round(100*unlist(list(misclassifcationRate=eta, "95pcMOE"=MOE95pc)),1)



