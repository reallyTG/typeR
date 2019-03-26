library(greybox)


### Name: errorType
### Title: Functions that extracts type of error from the model
### Aliases: errorType
### Keywords: models nonlinear regression ts

### ** Examples


xreg <- cbind(rnorm(100,10,3),rnorm(100,50,5))
xreg <- cbind(100+0.5*xreg[,1]-0.75*xreg[,2]+rnorm(100,0,3),xreg,rnorm(100,300,10))
colnames(xreg) <- c("y","x1","x2","Noise")
ourModel <- alm(y~x1+x2,as.data.frame(xreg))

errorType(ourModel)




