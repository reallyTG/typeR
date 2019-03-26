library(greybox)


### Name: pointLik
### Title: Point likelihood values
### Aliases: pointLik
### Keywords: htest

### ** Examples


xreg <- cbind(rnorm(100,10,3),rnorm(100,50,5))
xreg <- cbind(100+0.5*xreg[,1]-0.75*xreg[,2]+rnorm(100,0,3),xreg,rnorm(100,300,10))
colnames(xreg) <- c("y","x1","x2","Noise")
ourModel <- alm(y~x1+x2,as.data.frame(xreg))

pointLik(ourModel)

# Bias correction
pointLik(ourModel) - nParam(ourModel)

# Bias correction in AIC style
2*(nParam(ourModel)/nobs(ourModel) - pointLik(ourModel))

# BIC calculation based on pointLik
log(nobs(ourModel))*nParam(ourModel) - 2*sum(pointLik(ourModel))




