library(inarmix)


### Name: diagnose
### Title: Diagnostics for the model fit.
### Aliases: diagnose
### Keywords: print

### ** Examples

XX <- cbind(rep(1,9),c(0:8)/4)
colnames(XX) <- c("const","time")
coefs <- rbind(c(-.2,0),c(1.2,.3))
alpha <- c(.2,.2)
scale <- c(2,2)
mix.prop <- c(.8,.2)

testdat <- GenerateMixData(200,coefs,alpha,scale,mix.prop,XX)
testfit <- inarmix(y~time,nclasses=2,id=subject,data=testdat,maxiter=3)

diagnose(testfit)



